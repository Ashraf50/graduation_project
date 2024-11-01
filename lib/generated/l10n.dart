// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to AroundU`
  String get Welcome {
    return Intl.message(
      'Welcome to AroundU',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Easily explore`
  String get Easily_explore {
    return Intl.message(
      'Easily explore',
      name: 'Easily_explore',
      desc: '',
      args: [],
    );
  }

  /// `Ready to get started?`
  String get Ready {
    return Intl.message(
      'Ready to get started?',
      name: 'Ready',
      desc: '',
      args: [],
    );
  }

  /// `your ultimate solution for student needs!`
  String get text_splash1 {
    return Intl.message(
      'your ultimate solution for student needs!',
      name: 'text_splash1',
      desc: '',
      args: [],
    );
  }

  /// `Easily explore available apartments nearby, and find the closest restaurants, banks, and hospitals.`
  String get text_splash2 {
    return Intl.message(
      'Easily explore available apartments nearby, and find the closest restaurants, banks, and hospitals.',
      name: 'text_splash2',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy a seamless experience finding everything you need.`
  String get text_splash3 {
    return Intl.message(
      'Enjoy a seamless experience finding everything you need.',
      name: 'text_splash3',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message(
      'Register',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_pass {
    return Intl.message(
      'Confirm password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Continue as a Guest`
  String get guest {
    return Intl.message(
      'Continue as a Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get forget_pass {
    return Intl.message(
      'Forget password?',
      name: 'forget_pass',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get don_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'don_have_account',
      desc: '',
      args: [],
    );
  }

  /// `     OR     `
  String get or {
    return Intl.message(
      '     OR     ',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit {
    return Intl.message(
      'Edit Profile',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us`
  String get rate {
    return Intl.message(
      'Rate Us',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact {
    return Intl.message(
      'Contact Us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Policy`
  String get privacy {
    return Intl.message(
      'Privacy & Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `About US`
  String get about {
    return Intl.message(
      'About US',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to AroundU! We are dedicated to making your search for rental properties and essential services as seamless and stress-free as possible. Our platform offers a comprehensive directory of available rental apartments and provides information about nearby restaurants, banks, hospitals, and pharmacies to enhance your living experience. What sets us apart is our integrated chat service, enabling easy and direct communication between users. Our mission is to create a user-friendly environment that simplifies the rental process and connects you to essential services in your area.Experience convenience, transparency, and support all in one place with AroundU.`
  String get about_us {
    return Intl.message(
      'Welcome to AroundU! We are dedicated to making your search for rental properties and essential services as seamless and stress-free as possible. Our platform offers a comprehensive directory of available rental apartments and provides information about nearby restaurants, banks, hospitals, and pharmacies to enhance your living experience. What sets us apart is our integrated chat service, enabling easy and direct communication between users. Our mission is to create a user-friendly environment that simplifies the rental process and connects you to essential services in your area.Experience convenience, transparency, and support all in one place with AroundU.',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `If you have any questions, concerns, or feedback regarding this Privacy Policy or any aspect of your experience with AroundU, please feel free to reach out to us:`
  String get any_question {
    return Intl.message(
      'If you have any questions, concerns, or feedback regarding this Privacy Policy or any aspect of your experience with AroundU, please feel free to reach out to us:',
      name: 'any_question',
      desc: '',
      args: [],
    );
  }

  /// `Our team is available to assist you with any inquiries or issues you may have. We aim to respond to all communications promptly and efficiently.`
  String get our_team {
    return Intl.message(
      'Our team is available to assist you with any inquiries or issues you may have. We aim to respond to all communications promptly and efficiently.',
      name: 'our_team',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for using AroundU. We are committed to protecting your privacy and ensuring the security of your personal data. This policy outlines how we collect, use, protect, and share your information.`
  String get policy_thanks {
    return Intl.message(
      'Thank you for using AroundU. We are committed to protecting your privacy and ensuring the security of your personal data. This policy outlines how we collect, use, protect, and share your information.',
      name: 'policy_thanks',
      desc: '',
      args: [],
    );
  }

  /// `1. Data Collection`
  String get policy1 {
    return Intl.message(
      '1. Data Collection',
      name: 'policy1',
      desc: '',
      args: [],
    );
  }

  /// `We collect certain personal and non-personal information such as:\nAccount Information: Name, email address, and phone number when registering.\nGeolocation: To provide services related to nearby places (restaurants, banks, hospitals, pharmacies).\nUser Preferences: Preferred apartment features and search patterns.\nCommunication Data: When using the chat service to interact with owners or other users.`
  String get policy1_desc {
    return Intl.message(
      'We collect certain personal and non-personal information such as:\nAccount Information: Name, email address, and phone number when registering.\nGeolocation: To provide services related to nearby places (restaurants, banks, hospitals, pharmacies).\nUser Preferences: Preferred apartment features and search patterns.\nCommunication Data: When using the chat service to interact with owners or other users.',
      name: 'policy1_desc',
      desc: '',
      args: [],
    );
  }

  /// `2. Data Usage`
  String get policy2 {
    return Intl.message(
      '2. Data Usage',
      name: 'policy2',
      desc: '',
      args: [],
    );
  }

  /// `We use the information we collect to:\nEnhance user experience and provide personalized apartment recommendations.\nEnable services for finding nearby facilities (restaurants, banks, hospitals, pharmacies).\nFacilitate communication between users.`
  String get policy2_desc {
    return Intl.message(
      'We use the information we collect to:\nEnhance user experience and provide personalized apartment recommendations.\nEnable services for finding nearby facilities (restaurants, banks, hospitals, pharmacies).\nFacilitate communication between users.',
      name: 'policy2_desc',
      desc: '',
      args: [],
    );
  }

  /// `3. Data Protection`
  String get policy3 {
    return Intl.message(
      '3. Data Protection',
      name: 'policy3',
      desc: '',
      args: [],
    );
  }

  /// `We implement technical and organizational measures to safeguard your personal data against unauthorized access or manipulation.`
  String get policy3_desc {
    return Intl.message(
      'We implement technical and organizational measures to safeguard your personal data against unauthorized access or manipulation.',
      name: 'policy3_desc',
      desc: '',
      args: [],
    );
  }

  /// `4. Data Sharing`
  String get policy4 {
    return Intl.message(
      '4. Data Sharing',
      name: 'policy4',
      desc: '',
      args: [],
    );
  }

  /// `We do not sell or rent your personal data to third parties. We may share data in the following situations:\nService Providers: Companies that provide services to us (e.g., mapping or payment processing).\nCompliance with Laws: If required to disclose data under legal obligations or proceedings.`
  String get policy4_desc {
    return Intl.message(
      'We do not sell or rent your personal data to third parties. We may share data in the following situations:\nService Providers: Companies that provide services to us (e.g., mapping or payment processing).\nCompliance with Laws: If required to disclose data under legal obligations or proceedings.',
      name: 'policy4_desc',
      desc: '',
      args: [],
    );
  }

  /// `5. User Rights`
  String get policy5 {
    return Intl.message(
      '5. User Rights',
      name: 'policy5',
      desc: '',
      args: [],
    );
  }

  /// `You have the right to modify or delete your personal information through account settings or by contacting us directly.`
  String get policy5_desc {
    return Intl.message(
      'You have the right to modify or delete your personal information through account settings or by contacting us directly.',
      name: 'policy5_desc',
      desc: '',
      args: [],
    );
  }

  /// `6. Policy Updates`
  String get policy6 {
    return Intl.message(
      '6. Policy Updates',
      name: 'policy6',
      desc: '',
      args: [],
    );
  }

  /// `We may update this policy from time to time. You will be notified of any changes via the app or email.`
  String get policy6_desc {
    return Intl.message(
      'We may update this policy from time to time. You will be notified of any changes via the app or email.',
      name: 'policy6_desc',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to AroundU. By using our application, you agree to comply with and be bound by the following terms and conditions. Please read them carefully.`
  String get terms_welcome {
    return Intl.message(
      'Welcome to AroundU. By using our application, you agree to comply with and be bound by the following terms and conditions. Please read them carefully.',
      name: 'terms_welcome',
      desc: '',
      args: [],
    );
  }

  /// `1. Acceptance of Terms`
  String get terms1 {
    return Intl.message(
      '1. Acceptance of Terms',
      name: 'terms1',
      desc: '',
      args: [],
    );
  }

  /// `By accessing or using AroundU, you agree to these terms and conditions. If you do not agree, please do not use the app.`
  String get terms1_desc {
    return Intl.message(
      'By accessing or using AroundU, you agree to these terms and conditions. If you do not agree, please do not use the app.',
      name: 'terms1_desc',
      desc: '',
      args: [],
    );
  }

  /// `2. User Responsibilities`
  String get terms2 {
    return Intl.message(
      '2. User Responsibilities',
      name: 'terms2',
      desc: '',
      args: [],
    );
  }

  /// `Account Security: You are responsible for maintaining the confidentiality of your login credentials.\nAccurate Information: You must provide accurate, current, and complete information when registering and using the app.\nLawful Use: You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others or restrict or inhibit their use of the app.`
  String get terms2_desc {
    return Intl.message(
      'Account Security: You are responsible for maintaining the confidentiality of your login credentials.\nAccurate Information: You must provide accurate, current, and complete information when registering and using the app.\nLawful Use: You agree to use the app only for lawful purposes and in a way that does not infringe the rights of others or restrict or inhibit their use of the app.',
      name: 'terms2_desc',
      desc: '',
      args: [],
    );
  }

  /// `3. Services Provided`
  String get terms3 {
    return Intl.message(
      '3. Services Provided',
      name: 'terms3',
      desc: '',
      args: [],
    );
  }

  /// `Around allows users to:\nSearch and view available rental apartments.\nFind nearby services such as restaurants, banks, hospitals, and pharmacies.\nCommunicate with property owners and other users through the chat feature.`
  String get terms3_desc {
    return Intl.message(
      'Around allows users to:\nSearch and view available rental apartments.\nFind nearby services such as restaurants, banks, hospitals, and pharmacies.\nCommunicate with property owners and other users through the chat feature.',
      name: 'terms3_desc',
      desc: '',
      args: [],
    );
  }

  /// `4. Limitation of Liability`
  String get terms4 {
    return Intl.message(
      '4. Limitation of Liability',
      name: 'terms4',
      desc: '',
      args: [],
    );
  }

  /// `AroundU is not responsible for any agreements or disputes that arise between users and property owners. Users interact and make arrangements at their own discretion.`
  String get terms4_desc {
    return Intl.message(
      'AroundU is not responsible for any agreements or disputes that arise between users and property owners. Users interact and make arrangements at their own discretion.',
      name: 'terms4_desc',
      desc: '',
      args: [],
    );
  }

  /// `5. Privacy`
  String get terms5 {
    return Intl.message(
      '5. Privacy',
      name: 'terms5',
      desc: '',
      args: [],
    );
  }

  /// `Your use of AroundU is also governed by our Privacy Policy, which explains how we collect, use, and share your data.`
  String get terms5_desc {
    return Intl.message(
      'Your use of AroundU is also governed by our Privacy Policy, which explains how we collect, use, and share your data.',
      name: 'terms5_desc',
      desc: '',
      args: [],
    );
  }

  /// `6. Intellectual Property`
  String get terms6 {
    return Intl.message(
      '6. Intellectual Property',
      name: 'terms6',
      desc: '',
      args: [],
    );
  }

  /// `All content on AroundU, including but not limited to text, graphics, logos, and software, is owned by or licensed to AroundU and is protected by intellectual property laws. Unauthorized use is prohibited.`
  String get terms6_desc {
    return Intl.message(
      'All content on AroundU, including but not limited to text, graphics, logos, and software, is owned by or licensed to AroundU and is protected by intellectual property laws. Unauthorized use is prohibited.',
      name: 'terms6_desc',
      desc: '',
      args: [],
    );
  }

  /// `7. Termination`
  String get terms7 {
    return Intl.message(
      '7. Termination',
      name: 'terms7',
      desc: '',
      args: [],
    );
  }

  /// `We reserve the right to suspend or terminate your access to AroundU at our discretion, without prior notice, for violations of these terms or other inappropriate behavior.`
  String get terms7_desc {
    return Intl.message(
      'We reserve the right to suspend or terminate your access to AroundU at our discretion, without prior notice, for violations of these terms or other inappropriate behavior.',
      name: 'terms7_desc',
      desc: '',
      args: [],
    );
  }

  /// `8. Modifications to Terms`
  String get terms8 {
    return Intl.message(
      '8. Modifications to Terms',
      name: 'terms8',
      desc: '',
      args: [],
    );
  }

  /// `AroundU may revise these terms from time to time. Any changes will be communicated through the app, and your continued use of the app signifies your acceptance of the modified terms.`
  String get terms8_desc {
    return Intl.message(
      'AroundU may revise these terms from time to time. Any changes will be communicated through the app, and your continued use of the app signifies your acceptance of the modified terms.',
      name: 'terms8_desc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
