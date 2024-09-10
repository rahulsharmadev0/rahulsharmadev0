import 'package:flutter/material.dart';
import 'package:rsprofile/const/globle_variable.dart';
import 'package:url_launcher/url_launcher.dart';

class ContectSection extends StatelessWidget {
  const ContectSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            bottom: 16,
            child: Text(
              'Designed & Built by rahulsharmadev',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '04. What’s Next?',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Theme.of(context).primaryColor, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('Get In Touch', style: Theme.of(context).textTheme.displayLarge),
                ),
                Text(
                  'Although I’m currently looking for any new opportunities,'
                  ' my inbox is always open. Whether you have a question or just want'
                  ' to say hi, I’ll try my best to get back to you!',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size.fromHeight(kToolbarHeight),
                      ),
                      onPressed: () => launchUrl(MyProfile.email().uri),
                      child: const Text('Say Hello!')),
                ),
              ],
            ),
          )
        ]));
  }
}
