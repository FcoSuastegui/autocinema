package com.apleeks.autocinema

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull;

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        SrPagoApleeks(this, flutterEngine)
        super.configureFlutterEngine(flutterEngine)
    }
}
