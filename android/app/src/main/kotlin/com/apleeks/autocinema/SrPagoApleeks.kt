package com.apleeks.autocinema

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import android.os.Build
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat
import com.srpago.library.SpTokenListener
import com.srpago.library.SrPago
import com.srpago.library.model.Card
import com.srpago.library.model.SrPagoError
import com.srpago.library.model.Token
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.util.*


class SrPagoApleeks internal constructor(private val activity: Activity, flutterEngine: FlutterEngine) : MethodCallHandler {
    var LOG = "app.autocinema.apleeks"
    private var flutterResult: MethodChannel.Result? = null
    var srPago: SrPago? = null

    @RequiresApi(api = Build.VERSION_CODES.N)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "checkPermissions" -> checkPermissions(result)
            "requestPermissions" -> requestPermissions(result)
            "getToken" -> getToken(result, call)
            else -> result.notImplemented()
        }
    }

    private fun checkPermissions(result: MethodChannel.Result) {
        val status = ContextCompat.checkSelfPermission(activity, Manifest.permission.ACCESS_FINE_LOCATION)
        if (status == PackageManager.PERMISSION_GRANTED) {
            result.success("granted")
            try {
                srPago = SrPago.getInstance(activity)
                Log.d(LOG, "onCreate: load Sr Pago")
            } catch (ex: Exception) {
                //Manage exception
            }
        } else {
            result.success("denied")
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private fun requestPermissions(result: MethodChannel.Result) {
        if (flutterResult != null) {
            result.error("PENDING_TASK", "You have a pending task", null)
            return
        }
        flutterResult = result
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            activity.requestPermissions(arrayOf(
                    Manifest.permission.ACCESS_FINE_LOCATION
            ), MY_PERMISSIONS_REQUEST_LOCATION)
        } else {
            flutterResult!!.success("granted")
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    private fun getToken(result: MethodChannel.Result, call: MethodCall) {
        val response = HashMap<String, Any?>()
        response["status"] = false
        response["token"] = ""
        response["message"] = ""
        val data = call.arguments as HashMap<String, Any>
        val publicKey = data["publicKey"] as String?
        val liveMode = data["liveMode"] as Boolean
        val creditCard = data["creditCard"] as HashMap<String, Any>?
        Log.d(LOG, data.toString())
        Log.d(LOG, publicKey)
        if (srPago != null) {
            Log.d(LOG, "srpago no es null")
            srPago!!.isLiveMode = liveMode
            srPago!!.publishableKey = publicKey
        }
        val card = Card()
        card.name = creditCard!!["name"].toString()
        card.number = creditCard["number"].toString()
        card.cvv = creditCard["cvv"].toString()
        card.expMonth = creditCard["month"].toString()
        card.expYear = creditCard["year"].toString()
        try {
            srPago!!.createToken(card, object : SpTokenListener {
                @RequiresApi(api = Build.VERSION_CODES.N)
                override fun onSuccess(spToken: Token) {
                    response.replace("status", true)
                    response.replace("token", spToken.token)
                    Log.d(LOG, "onSuccess: El token generado es: " + spToken.token + " " + response.toString())
                    result.success(response)
                }

                @RequiresApi(api = Build.VERSION_CODES.N)
                override fun onError(error: SrPagoError) {
                    response.replace("message", error.message)
                    Log.d(LOG, "OnSrPagoError: Hubo un error " + error.message)
                    result.success(response)
                }
            })
        } catch (ex: Exception) {
            response.replace("message", ex.message)
            Log.d(LOG, "El método falló " + ex.message)
            result.success(response)
        }
    }

    companion object {
        const val MY_PERMISSIONS_REQUEST_LOCATION = 99
    }

    init {
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        val channel = MethodChannel(messenger, "app.sr.pago.apleeks")
        channel.setMethodCallHandler(this)
        val registry = ShimPluginRegistry(flutterEngine)
        val registrar = registry.registrarFor("app.meedu/geolocation")
        registrar.addRequestPermissionsResultListener { requestCode: Int, permissions: Array<String?>?, grantResults: IntArray ->
            Log.i("LALA", "REQUEST_CODE $requestCode")
            if (requestCode == MY_PERMISSIONS_REQUEST_LOCATION) {
                if (grantResults.size > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    try {
                        srPago = SrPago.getInstance(activity)
                        Log.d(LOG, "onCreate: load Sr Pago")
                    } catch (ex: Exception) {
                        //Manage exception
                    }
                    flutterResult!!.success("granted")
                } else {
                    flutterResult!!.success("denied")
                }
                flutterResult = null
            }
            false
        }
    }
}
