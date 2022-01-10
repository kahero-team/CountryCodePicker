import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('it'),
        Locale('en'),
      ],
      localizationsDelegates: [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('CountryPicker Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CountryCodePicker(
                onChanged: print,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IT',
                favorite: ['+39', 'FR'],
                showFlag: false,
                showFlagDialog: true,
                comparator: (a, b) => b.name.compareTo(a.name),
                //Get the country information relevant to the initial selection
                onInit: (code) => print("${code.name} ${code.dialCode}"),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: print,
                    initialSelection: 'TF',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    alignLeft: true,
                    builder: (countryCode) {
                      return Text('${countryCode.code}');
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 400,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    onChanged: print,
                    initialSelection: 'TF',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: ['+39', 'FR'],
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CountryCodePicker(
                    enabled: false,
                    onChanged: (c) => c.name,
                    initialSelection: 'TF',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: ['+39', 'FR'],
                  ),
                ),
              ),
              CountryCodePicker(
                // initialSelection:
                //     widget.controller.values['country'] != '' &&
                //             widget.controller.values['country'] != null
                //         ? widget.controller.values['country']
                //         : null,
                initialSelection: null,
                showCountryOnly: true,
                showOnlyCountryWhenClosed: true,
                alignLeft: true,
                border: true,
                borderRadius: 10.0,
                borderWidth: 404.0,
                borderHeight: 60.0,
                icon: true,
                iconSize: 35,
                onChanged: (countryCode) {
                  // FocusScope.of(context).requestFocus(FocusNode());
                  // if (countryCode.code != 'PH') {
                  //   widget.controller.save('mobileNo')('');
                  // }
                  // widget.controller.save('country')(countryCode.code);
                  // widget.onCountryChange(countryCode.code);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
