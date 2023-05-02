import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/core/widgets/grid/sw_column.dart';
import 'validator_models.dart';

bool emailValid(String email) {
  bool resp = false;
  RegExp regex = RegExp(r'^[\w](\.?[\w-]{1,20})+@([\w-]+\.)+[\w-]{2,4}$'); 

  if(regex.hasMatch(email)) resp = true;

  return resp;
}

bool isValidCIF(String email) {
  bool resp = false;
  RegExp regex = RegExp(r'^[\d]{8}[a-zA-Z]$'); 

  if(regex.hasMatch(email)) resp = true;

  return resp;
}

bool isNumber(String email) {
  bool resp = false;
  RegExp regex = RegExp(r'^[0-9]+\.?[0-9]+$'); 

  if(regex.hasMatch(email)) resp = true;

  return resp;
}

class SwTextField extends StatefulWidget {
  final String name;
  final Validator? validator;
  final String? initial;
  final String? placeholder;
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final bool readOnly;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final Widget? suffixIcon;
  final Function(bool)? onValidate;
  final TextCapitalization? textCapitalization;
  final AutovalidateMode? autoValidateMode;
  final GlobalKey<FormState>? formKey;
  final Function(dynamic)? onFieldSubmitted;

  const SwTextField({
    super.key,
    this.name = '',
    this.placeholder,
    this.validator,
    this.initial,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.formKey,
    this.readOnly = false,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
    this.onValidate,
    this.autoValidateMode,
    this.onFieldSubmitted,
    this.textCapitalization
  });

  @override
  State<SwTextField> createState() => _SwTextFieldState();
}

class _SwTextFieldState extends State<SwTextField> {
  final color = const Color(0xFF243656);
  late TextEditingController _controller;
  String? errorText;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController(
      text: widget.initial 
    );
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
      gap: 4,
      children: [
        widget.name != ''
          ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.name, style: TextStyle(color: color)) 
          )
          : null,
        TextFormField(
          controller: _controller,
          textInputAction: widget.textInputAction,
          textCapitalization: widget.textCapitalization??TextCapitalization.none,
          keyboardType: widget.keyboardType,
          enabled: !widget.readOnly,
          onChanged: (String value) {
            // setState(() {
            //   errorText = _validator(value);
            // });
            // widget.formKey?.currentState?.validate();

            widget.onChanged?.call(value);
          },
          minLines: widget.minLines,
          inputFormatters: widget.inputFormatters,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText!,
          onSaved: (value) {
            if(widget.onSaved != null) widget.onSaved!(value ?? '');
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          decoration: InputDecoration(
            errorText: errorText,
            errorStyle: const TextStyle(fontSize: 14),
            hintText: widget.placeholder,
            filled: widget.readOnly,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10
            ),
            suffixIcon: widget.suffixIcon,
            fillColor: const Color(0xFFEAEEF0),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.cyan,
                width: 1.5,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
            enabledBorder:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: color.withOpacity(0.8),
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.05),
                width: 1.5,
              ),
            ),
            border: const OutlineInputBorder(),
          ),
          validator: _validator
        )
      ],
    );
  }

  String _message(ValidateKey key, String defaultMsg) =>
    widget.validator?.message?[key] ?? defaultMsg;

  String? _validator(String? value) {
    String? message;

    if(value != null) {
      if((widget.validator?.required == null || widget.validator?.required == true) && value.isEmpty) {
        message = _message(
          ValidateKey.required,
          'Campo es obligatorio.'
        );
      }

      if(value.isNotEmpty) {
        if(
          widget.validator?.format == FieldFormat.email &&
          !emailValid(value)
        ) {
          message = _message(
            ValidateKey.email,
            'Email no válido.'
          );
        }

        if(
          widget.validator?.format == FieldFormat.cif &&
          !isValidCIF(value)
        ) {
          message = _message(
            ValidateKey.cif,
            'CIF/NIF no válido.'
          );
        }

        if(
          widget.validator?.format == FieldFormat.number &&
          !isNumber(value)
        ) {
          message = _message(
            ValidateKey.email,
            'El campo tiene que ser numérico.'
          );
        }

        final min = widget.validator?.min; 
        final max = widget.validator?.max; 

        if(min != null && value.length < min) {
          message = _message(
            ValidateKey.min,
            'Se permite como mínimo $min caracteres.'
          );
        } 

        if(max != null && value.length > max) {
          message = _message(
            ValidateKey.min,
            'Se permite como máximo $max caracteres.'
          );
        }

        final equalTo = widget.validator?.equalTo; 
        if(equalTo != null && equalTo != value) {
          message = _message(
            ValidateKey.equalTo,
            'El campo no coincide.'
          );
        }
      }
    }
    if(widget.onValidate != null) {
      if(message == null) {
        widget.onValidate!(true);
      } else {
        widget.onValidate!(false);
      } 
    }
    
    return message;
  }
}
