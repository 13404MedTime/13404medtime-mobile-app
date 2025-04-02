import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/extension/extension.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.colorScheme.surface,
        appBar: AppBar(
          title: Text(
            context.translate('about_the_app'),
            style: context.theme.appBarTheme.titleTextStyle,
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: AppUtils.kPaddingAll16,
                sliver: SliverToBoxAdapter(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '${context.translate('about_us_text')} '),
                        TextSpan(
                          text: 'support@madadio.uz',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2,
                            color: context.theme.colorScheme.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              final String email = Uri.encodeComponent('support@madadio.uz');
                              final String subject = Uri.encodeComponent('');
                              final String body = Uri.encodeComponent('');
                              final Uri mail = Uri.parse('mailto:$email?subject=$subject&body=$body');
                              await launchUrl(mail);
                            },
                        ),
                      ],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        color: Color(0xFF2A2828),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
