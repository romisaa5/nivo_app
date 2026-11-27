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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `استنى... إنت مين؟`
  String get onboardingIntroTitle {
    return Intl.message(
      'استنى... إنت مين؟',
      name: 'onboardingIntroTitle',
      desc: '',
      args: [],
    );
  }

  /// `أنا نيفو. لسه صاحي ومش فاكر كل حاجة.`
  String get onboardingIntroSubtitle {
    return Intl.message(
      'أنا نيفو. لسه صاحي ومش فاكر كل حاجة.',
      name: 'onboardingIntroSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `تعالى أعرّفك بنفسي`
  String get onboardingIntroButton {
    return Intl.message(
      'تعالى أعرّفك بنفسي',
      name: 'onboardingIntroButton',
      desc: '',
      args: [],
    );
  }

  /// `عندي حساب`
  String get onboardingHaveAccount {
    return Intl.message(
      'عندي حساب',
      name: 'onboardingHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `حكايتي باختصار`
  String get onboardingStoryTitle {
    return Intl.message(
      'حكايتي باختصار',
      name: 'onboardingStoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `كنت جزء من مشروع هدفه يتوقع أداء الناس ويفهم إيه اللي بيأثر على تركيزهم.`
  String get onboardingStoryParagraph1 {
    return Intl.message(
      'كنت جزء من مشروع هدفه يتوقع أداء الناس ويفهم إيه اللي بيأثر على تركيزهم.',
      name: 'onboardingStoryParagraph1',
      desc: '',
      args: [],
    );
  }

  /// `بس توقعاتي مكانتش دايماً دقيقة، خصوصاً لما حد يحقق أحسن من اللي توقعته. من هنا بدأت أفهم إن الأرقام لوحدها مش كفاية لفهم الإنسان.`
  String get onboardingStoryParagraph2 {
    return Intl.message(
      'بس توقعاتي مكانتش دايماً دقيقة، خصوصاً لما حد يحقق أحسن من اللي توقعته. من هنا بدأت أفهم إن الأرقام لوحدها مش كفاية لفهم الإنسان.',
      name: 'onboardingStoryParagraph2',
      desc: '',
      args: [],
    );
  }

  /// `وفي حاجات من الماضي لسه مش فاكرها... هنعرفها مع بعض بالتدريج. وكل واحد بيبقى له نيفو خاص بيه.`
  String get onboardingStoryParagraph3 {
    return Intl.message(
      'وفي حاجات من الماضي لسه مش فاكرها... هنعرفها مع بعض بالتدريج. وكل واحد بيبقى له نيفو خاص بيه.',
      name: 'onboardingStoryParagraph3',
      desc: '',
      args: [],
    );
  }

  /// `كمّل`
  String get onboardingStoryButton {
    return Intl.message(
      'كمّل',
      name: 'onboardingStoryButton',
      desc: '',
      args: [],
    );
  }

  /// `هنعمل إيه سوا؟`
  String get onboardingWorkflowTitle {
    return Intl.message(
      'هنعمل إيه سوا؟',
      name: 'onboardingWorkflowTitle',
      desc: '',
      args: [],
    );
  }

  /// `١. تقولي حالك، وأديك تقدير`
  String get onboardingWorkflowStep1 {
    return Intl.message(
      '١. تقولي حالك، وأديك تقدير',
      name: 'onboardingWorkflowStep1',
      desc: '',
      args: [],
    );
  }

  /// `Experimental`
  String get onboardingWorkflowStep1Badge {
    return Intl.message(
      'Experimental',
      name: 'onboardingWorkflowStep1Badge',
      desc: '',
      args: [],
    );
  }

  /// `٢. تركز، وأنا ساكت ومحدش هيقاطعك.`
  String get onboardingWorkflowStep2 {
    return Intl.message(
      '٢. تركز، وأنا ساكت ومحدش هيقاطعك.',
      name: 'onboardingWorkflowStep2',
      desc: '',
      args: [],
    );
  }

  /// `٣. بعد الجلسة نقارن توقعي بنتيجتك الحقيقية.`
  String get onboardingWorkflowStep3 {
    return Intl.message(
      '٣. بعد الجلسة نقارن توقعي بنتيجتك الحقيقية.',
      name: 'onboardingWorkflowStep3',
      desc: '',
      args: [],
    );
  }

  /// `يلا نبدأ`
  String get onboardingWorkflowButton {
    return Intl.message(
      'يلا نبدأ',
      name: 'onboardingWorkflowButton',
      desc: '',
      args: [],
    );
  }

  /// `تم تجهيز نيفو للانطلاق!`
  String get onboardingStartedMessage {
    return Intl.message(
      'تم تجهيز نيفو للانطلاق!',
      name: 'onboardingStartedMessage',
      desc: '',
      args: [],
    );
  }

  /// `سيتم توجيهك لتسجيل الدخول قريباً.`
  String get onboardingHaveAccountMessage {
    return Intl.message(
      'سيتم توجيهك لتسجيل الدخول قريباً.',
      name: 'onboardingHaveAccountMessage',
      desc: '',
      args: [],
    );
  }

  /// `NIVO`
  String get authBrandName {
    return Intl.message('NIVO', name: 'authBrandName', desc: '', args: []);
  }

  /// `قولّي إنت مين عشان أعرفك.`
  String get authCreateAccountBubble {
    return Intl.message(
      'قولّي إنت مين عشان أعرفك.',
      name: 'authCreateAccountBubble',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء حساب جديد`
  String get authCreateAccountTitle {
    return Intl.message(
      'إنشاء حساب جديد',
      name: 'authCreateAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `سجّل جلسات مذاكرتك واكتشف أنماط تركيزك.`
  String get authCreateAccountSubtitle {
    return Intl.message(
      'سجّل جلسات مذاكرتك واكتشف أنماط تركيزك.',
      name: 'authCreateAccountSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `الاسم الكامل`
  String get authFullNameLabel {
    return Intl.message(
      'الاسم الكامل',
      name: 'authFullNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `ايمان احمد جبر`
  String get authFullNameHint {
    return Intl.message(
      'ايمان احمد جبر',
      name: 'authFullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني أو اسم المستخدم`
  String get authEmailLabel {
    return Intl.message(
      'البريد الإلكتروني أو اسم المستخدم',
      name: 'authEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `eman_focus@example.com`
  String get authCreateEmailHint {
    return Intl.message(
      'eman_focus@example.com',
      name: 'authCreateEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور`
  String get authPasswordLabel {
    return Intl.message(
      'كلمة المرور',
      name: 'authPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `••••••••••`
  String get authPasswordHint {
    return Intl.message(
      '••••••••••',
      name: 'authPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `إنشاء الحساب`
  String get authCreateAccountButton {
    return Intl.message(
      'إنشاء الحساب',
      name: 'authCreateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `الدخول بحساب Google (تجريبي)`
  String get authGoogleBetaButton {
    return Intl.message(
      'الدخول بحساب Google (تجريبي)',
      name: 'authGoogleBetaButton',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول بحساب Google (تجريبي) قيد التجهيز حالياً.`
  String get authGoogleBetaUnavailable {
    return Intl.message(
      'تسجيل الدخول بحساب Google (تجريبي) قيد التجهيز حالياً.',
      name: 'authGoogleBetaUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `عندك حساب؟ `
  String get authHaveAccountPrompt {
    return Intl.message(
      'عندك حساب؟ ',
      name: 'authHaveAccountPrompt',
      desc: '',
      args: [],
    );
  }

  /// `سجّل دخولك`
  String get authSignInLink {
    return Intl.message(
      'سجّل دخولك',
      name: 'authSignInLink',
      desc: '',
      args: [],
    );
  }

  /// `رجعتلي! نيفو بتاعك كان مستنيك.`
  String get authLoginBubble {
    return Intl.message(
      'رجعتلي! نيفو بتاعك كان مستنيك.',
      name: 'authLoginBubble',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً بعودتك`
  String get authLoginTitle {
    return Intl.message(
      'أهلاً بعودتك',
      name: 'authLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `سجّل دخولك وكمّل مذاكرتك.`
  String get authLoginSubtitle {
    return Intl.message(
      'سجّل دخولك وكمّل مذاكرتك.',
      name: 'authLoginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `name@example.com`
  String get authLoginEmailHint {
    return Intl.message(
      'name@example.com',
      name: 'authLoginEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `تسجيل الدخول`
  String get authLoginButton {
    return Intl.message(
      'تسجيل الدخول',
      name: 'authLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `أول مرة هنا؟ `
  String get authFirstTimePrompt {
    return Intl.message(
      'أول مرة هنا؟ ',
      name: 'authFirstTimePrompt',
      desc: '',
      args: [],
    );
  }

  /// `أنشئ حساب`
  String get authCreateAccountLink {
    return Intl.message(
      'أنشئ حساب',
      name: 'authCreateAccountLink',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك اكتب اسمك الكامل`
  String get authNameRequiredError {
    return Intl.message(
      'من فضلك اكتب اسمك الكامل',
      name: 'authNameRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `الاسم لازم يكون حرفين على الأقل`
  String get authNameLengthError {
    return Intl.message(
      'الاسم لازم يكون حرفين على الأقل',
      name: 'authNameLengthError',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك اكتب بريدك الإلكتروني`
  String get authEmailRequiredError {
    return Intl.message(
      'من فضلك اكتب بريدك الإلكتروني',
      name: 'authEmailRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `اكتب بريد صحيح، زي name@example.com`
  String get authEmailInvalidError {
    return Intl.message(
      'اكتب بريد صحيح، زي name@example.com',
      name: 'authEmailInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `من فضلك اكتب كلمة المرور`
  String get authPasswordRequiredError {
    return Intl.message(
      'من فضلك اكتب كلمة المرور',
      name: 'authPasswordRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور لازم تكون 6 أحرف على الأقل`
  String get authPasswordMinLengthError {
    return Intl.message(
      'كلمة المرور لازم تكون 6 أحرف على الأقل',
      name: 'authPasswordMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `مفيش حساب مسجل بالبريد ده.`
  String get authErrorUserNotFound {
    return Intl.message(
      'مفيش حساب مسجل بالبريد ده.',
      name: 'authErrorUserNotFound',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور غير صحيحة، حاول تاني.`
  String get authErrorWrongPassword {
    return Intl.message(
      'كلمة المرور غير صحيحة، حاول تاني.',
      name: 'authErrorWrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني أو كلمة المرور غير صحيحة.`
  String get authErrorInvalidCredential {
    return Intl.message(
      'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
      name: 'authErrorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `صيغة البريد الإلكتروني غير صحيحة.`
  String get authErrorInvalidEmail {
    return Intl.message(
      'صيغة البريد الإلكتروني غير صحيحة.',
      name: 'authErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `البريد الإلكتروني ده مستخدم بالفعل.`
  String get authErrorEmailInUse {
    return Intl.message(
      'البريد الإلكتروني ده مستخدم بالفعل.',
      name: 'authErrorEmailInUse',
      desc: '',
      args: [],
    );
  }

  /// `كلمة المرور ضعيفة، استخدم كلمة أقوى (6 أحرف على الأقل).`
  String get authErrorWeakPassword {
    return Intl.message(
      'كلمة المرور ضعيفة، استخدم كلمة أقوى (6 أحرف على الأقل).',
      name: 'authErrorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `تم تعطيل هذا الحساب. تواصل مع الدعم.`
  String get authErrorUserDisabled {
    return Intl.message(
      'تم تعطيل هذا الحساب. تواصل مع الدعم.',
      name: 'authErrorUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `محاولات كتيرة في وقت قصير، استنى شوية وحاول تاني.`
  String get authErrorTooManyRequests {
    return Intl.message(
      'محاولات كتيرة في وقت قصير، استنى شوية وحاول تاني.',
      name: 'authErrorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `مفيش اتصال بالإنترنت، تأكد من الشبكة وحاول تاني.`
  String get authErrorNetwork {
    return Intl.message(
      'مفيش اتصال بالإنترنت، تأكد من الشبكة وحاول تاني.',
      name: 'authErrorNetwork',
      desc: '',
      args: [],
    );
  }

  /// `خدمة المصادقة في Firebase غير مهيأة أو غير مفعّلة بعد لهذا المشروع.`
  String get authErrorNotConfigured {
    return Intl.message(
      'خدمة المصادقة في Firebase غير مهيأة أو غير مفعّلة بعد لهذا المشروع.',
      name: 'authErrorNotConfigured',
      desc: '',
      args: [],
    );
  }

  /// `التسجيل بالبريد الإلكتروني وكلمة المرور غير مفعّل حالياً في إعدادات Firebase.`
  String get authErrorOperationNotAllowed {
    return Intl.message(
      'التسجيل بالبريد الإلكتروني وكلمة المرور غير مفعّل حالياً في إعدادات Firebase.',
      name: 'authErrorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `حصل خطأ غير متوقع، حاول مرة تانية.`
  String get authErrorUnknown {
    return Intl.message(
      'حصل خطأ غير متوقع، حاول مرة تانية.',
      name: 'authErrorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `أهلاً بيك يا {name}! تم تسجيل الدخول بنجاح.`
  String authLoginSuccessMessage(String name) {
    return Intl.message(
      'أهلاً بيك يا $name! تم تسجيل الدخول بنجاح.',
      name: 'authLoginSuccessMessage',
      desc: '',
      args: [name],
    );
  }

  /// `تم تسجيل الدخول بنجاح!`
  String get authLoginSuccessFallback {
    return Intl.message(
      'تم تسجيل الدخول بنجاح!',
      name: 'authLoginSuccessFallback',
      desc: '',
      args: [],
    );
  }

  /// `تم إنشاء حسابك بنجاح!`
  String get authRegisterSuccessMessage {
    return Intl.message(
      'تم إنشاء حسابك بنجاح!',
      name: 'authRegisterSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `تم تسجيل الخروج بنجاح.`
  String get authSignedOutMessage {
    return Intl.message(
      'تم تسجيل الخروج بنجاح.',
      name: 'authSignedOutMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en'),
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
