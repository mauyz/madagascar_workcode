import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:madagascar_workcoode/core/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ColoredBox(
            color: themeData.colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Flexible(
                    child: CircleAvatar(
                      backgroundColor:themeData.colorScheme.inversePrimary,
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
                            style: themeData.textTheme.titleMedium,
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
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListBody(
              children: <Widget>[
                const SizedBox(
                  height: 15.0,
                ),
                SelectableLinkify(
                  text:
                      "${AppConstants.aboutApp} \n\n${AppConstants.appClause}"
                      "\n\nContact du développeur : ${AppConstants.mauyzEmail}",
                  style: themeData.textTheme.bodySmall,
                  onOpen: (link) async {
                    if (await canLaunchUrl(Uri.parse(link.url))) {
                      launchUrl(Uri.parse(link.url));
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
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
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Partager",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          Material(
            color: themeData.colorScheme.secondaryContainer,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
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
}
