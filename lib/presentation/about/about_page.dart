import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:madagascar_workcoode/core/app_constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        spacing: 2,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Flexible(
                  child: CircleAvatar(
                    child: IconTheme(
                      data: themeData.iconTheme,
                      child: Icon(Icons.assured_workload),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.appTitle,
                          style: themeData.textTheme.titleSmall,
                        ),
                        Text(
                          AppConstants.appVersion,
                          style: themeData.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
              bottom: 20,
            ),
            child: ListBody(
              children: <Widget>[
                SelectableLinkify(
                  text: "${AppConstants.aboutApp} \n\n${AppConstants.appClause}"
                      "\n\nMail : ${AppConstants.mauyzEmail}",
                  style: themeData.textTheme.bodySmall,
                  onOpen: (link) async {
                    if (await canLaunchUrl(Uri.parse(link.url))) {
                      launchUrl(Uri.parse(link.url));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    AppConstants.copyright,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Material(
            color: themeData.colorScheme.secondaryContainer,
            child: InkWell(
              onTap: () {
                _sendReport();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Contacter le développeur",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Material(
            color: themeData.colorScheme.secondaryContainer,
            child: InkWell(
              onTap: () {
                _shareApp();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Partager",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          Material(
            color: themeData.colorScheme.secondaryContainer,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  "Voir licences",
                ),
              ),
              onTap: () {
                showLicensePage(
                  context: context,
                  applicationName: AppConstants.appTitle,
                  applicationVersion: AppConstants.appVersion,
                  applicationIcon: CircleAvatar(
                    child: IconTheme(
                      data: themeData.iconTheme,
                      child: Icon(Icons.assured_workload),
                    ),
                  ),
                  applicationLegalese:
                      "${AppConstants.appClause}\n\n${AppConstants.copyright}",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendReport() async {
    final email = Email(
      recipients: [
        AppConstants.mauyzEmail,
      ],
    );
    try {
      await FlutterEmailSender.send(email);
    } catch (_) {
      final uri = Uri(
        scheme: 'mailto',
        path: AppConstants.mauyzEmail,
      );
      launchUrlString(uri.toString());
    }
  }

  void _shareApp() async {
    await Share.share(_getAppLink());
  }

  String _getAppLink() {
    if (Platform.isIOS) {
      //TODO
    }
    if (Platform.isLinux) {
      ///TODO
    }
    if (Platform.isWindows) {
      ///TODO
    }
    if (Platform.isMacOS) {
      ///TODO
    }
    return AppConstants.playStoreLink;
  }
}
