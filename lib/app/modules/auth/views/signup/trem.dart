import 'package:cash_mash_prime/app/components/buttons/red_outline_button.dart';
import 'package:cash_mash_prime/app/components/buttons/white_button.dart';
import 'package:cash_mash_prime/app/helpers/app_styles.dart';
import 'package:cash_mash_prime/app/modules/auth/controllers/signupcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TremSignUp extends StatelessWidget {
  final String policy = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque vestibulum nulla dolor, ut tincidunt turpis lobortis ut. Pellentesque porta sapien non ligula feugiat, sit amet accumsan nibh sollicitudin. Nam blandit sed quam vel laoreet. Integer at commodo est. In nulla magna, tempor in orci vel, auctor scelerisque urna. Nullam arcu felis, iaculis at tempor nec, fermentum molestie diam. Duis at lorem magna. Nam nibh lorem, molestie ac eleifend tempor, feugiat id magna. Praesent auctor feugiat purus eget maximus.

Donec dui nisi, porta et dui vitae, lacinia tristique ex. Pellentesque viverra, felis ultricies ultricies accumsan, dolor mauris rhoncus orci, a vestibulum magna justo nec urna. Vestibulum convallis sed neque eget fringilla. Etiam sapien orci, euismod non magna quis, tincidunt vestibulum urna. Cras ante eros, dictum finibus leo eu, scelerisque pretium ante. Morbi vitae convallis enim. Phasellus feugiat consectetur urna, eu porttitor elit vulputate nec.

Aliquam sed faucibus eros, in vestibulum nulla. Mauris quam lectus, congue quis mi sit amet, egestas semper velit. Morbi quis tempus arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Donec vestibulum nisl a sem tincidunt, ut faucibus magna gravida. Pellentesque sed velit justo. Morbi id metus quam. Sed tristique eu ante sit amet tincidunt. Maecenas scelerisque nulla eget pretium interdum.

Vestibulum luctus nisl nec aliquet cursus. Phasellus maximus, turpis sed elementum elementum, erat mauris pellentesque nunc, ac imperdiet mauris urna eu dolor. Quisque pharetra dui dolor. Aliquam imperdiet eros velit, at varius mi ullamcorper nec. Duis venenatis justo sed ultrices lacinia. Maecenas viverra, purus sit amet facilisis gravida, nunc tellus elementum nulla, eget ullamcorper erat lectus nec ante. Duis ornare nunc auctor viverra vestibulum. Vestibulum laoreet efficitur sollicitudin. Curabitur fermentum sollicitudin nulla, vel vestibulum nisl.

Nullam in consequat risus, facilisis aliquam felis. Curabitur finibus viverra metus, eu pharetra elit commodo sit amet. Aliquam imperdiet nec lectus quis eleifend. In varius euismod odio, eu luctus odio hendrerit at. Morbi aliquet arcu a velit efficitur efficitur. Ut faucibus accumsan magna, dignissim hendrerit libero rutrum a. Fusce molestie, ipsum at interdum porta, orci neque hendrerit nibh, in dapibus turpis enim eget leo. Praesent euismod turpis ac neque varius consectetur. Aliquam ut erat ut justo consectetur vestibulum.
''';
  static final String path = 'signup/trem';
  const TremSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Privacy Policy and Terms of Use',
                style: AppStyles.p.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
          ),
          SizedBox(
            height: 38,
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: RichText(text: TextSpan(text: policy)))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: RedOutlineButton(
                        onPressed: () {
                          Get.find<SignUpController>().handleBack();
                        },
                        padding: 7,
                        title: 'Decline')),
                Expanded(
                    child: WhiteButton(
                        onPressed: () {
                          Get.find<SignUpController>().handleNext();
                        },
                        padding: 7,
                        title: 'I accept')),
              ],
            ),
          )
        ],
      ),
    );
  }
}
