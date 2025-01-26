import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:madagascar_workcoode/core/app_constants.dart';
import 'package:open_store/open_store.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return ColoredBox(
      color: themeData.colorScheme.secondaryContainer,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: ListBody(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                  ),
                                  child: Text(
                                    AppConstants.appTitle,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  AppConstants.appVersion,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: SelectableLinkify(
                            text:
                                "${AppConstants.aboutApp} \n\n${AppConstants.appClause}"
                                "\nMail : ${AppConstants.mauyzEmail}",
                            style: themeData.textTheme.bodySmall,
                            onOpen: (link) async {
                              if (await canLaunchUrl(Uri.parse(link.url))) {
                                launchUrl(Uri.parse(link.url));
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            AppConstants.copyright,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              spacing: 1,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _openStore(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Noter l'application",
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _sendReport();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Contacter le développeur",
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        _shareApp();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          "Partager",
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Material(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openStore(BuildContext context) async {
    try {
      await OpenStore.instance.open(
        androidAppBundleId: AppConstants.androidId,
      );
    } catch (_) {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (buildContext) {
            return AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              content: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "L'application n'est pas encore disponible pour cette plateforme !",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: const Text("Fermer"),
                ),
              ],
            );
          },
        );
      }
    }
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
