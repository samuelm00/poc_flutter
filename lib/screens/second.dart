import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/api/api_service.dart';
import 'package:poc/bootstrap.dart';
import 'package:poc/config/l10n/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10 = AppLocalizationsX(context).l10n;
    final ApiService apiService = getIt.get<ApiService>();

    print(apiService.getPosts());

    final form = FormGroup({
      "email": FormControl<String>(validators: [
        Validators.required,
        Validators.email,
      ]),
      "password": FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(6),
      ])
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Simple Form with validation",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ReactiveForm(
              formGroup: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReactiveTextField(
                    formControlName: "email",
                    keyboardType: TextInputType.emailAddress,
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'The email must not be empty'
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  ReactiveTextField(
                    formControlName: "password",
                    validationMessages: {
                      ValidationMessage.required: (error) =>
                          'The Password must not be empty'
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (form.valid) {
                        context.pop();
                      } else {
                        form.markAllAsTouched();
                      }
                    },
                    child: const Text("Submit"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
