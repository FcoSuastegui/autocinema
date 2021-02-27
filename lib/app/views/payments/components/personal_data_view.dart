import 'package:autocinema/app/utils/formatters.dart';
import 'package:autocinema/app/views/payments/bloc/payments_bloc.dart';
import 'package:autocinema/app/widgets/TextField/input_text_cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class PersonalDataView extends StatelessWidget {
  const PersonalDataView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<PaymentsBloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          InputTextCupertino(
            textFieldBloc: bloc.name,
            placeholder: 'Nombre(s)',
            keyboardType: TextInputType.text,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.firstName,
                  placeholder: 'Primer apellido',
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.secondName,
                  placeholder: 'Segundo apellido',
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.email,
                  placeholder: 'Correo',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.address,
                  placeholder: 'Dirección',
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.phone,
                  placeholder: 'Telefono',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    MaskedTextInputFormatter(mask: "### #### ###", separator: " "),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownFieldBlocBuilder<String>(
              selectFieldBloc: bloc.states,
              decoration: InputDecoration(
                labelText: 'Estados',
                border: InputBorder.none,
              ),
              itemBuilder: (context, value) => value,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.city,
                  placeholder: 'Ciudad',
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: InputTextCupertino(
                  textFieldBloc: bloc.codigoPostal,
                  placeholder: 'Código postal',
                  keyboardType: TextInputType.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
