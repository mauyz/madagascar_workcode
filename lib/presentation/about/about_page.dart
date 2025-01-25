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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
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
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ListBody(
                  children: <Widget>[
                    const SizedBox(
                      height: 15.0,
                    ),
                    SelectableLinkify(
                      text: "${AppConstants.aboutApp} \n\n${AppConstants.appClause}"
                          "\n\nContact du développeur : ${AppConstants.mauyzEmail}",
                      style: themeData.textTheme.bodySmall,
                      onOpen: (link) async {
                        if (await canLaunchUrl(Uri.parse(link.url))) {
                          launchUrl(Uri.parse(link.url));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      AppConstants.copyright,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
