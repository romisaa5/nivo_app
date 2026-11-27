// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Welcome back, ${name}! Signed in successfully.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "authBrandName": MessageLookupByLibrary.simpleMessage("NIVO"),
    "authCreateAccountBubble": MessageLookupByLibrary.simpleMessage(
      "Tell me who you are so I know you.",
    ),
    "authCreateAccountButton": MessageLookupByLibrary.simpleMessage(
      "Create Account",
    ),
    "authCreateAccountLink": MessageLookupByLibrary.simpleMessage(
      "Create account",
    ),
    "authCreateAccountSubtitle": MessageLookupByLibrary.simpleMessage(
      "Log your study sessions and discover your focus patterns.",
    ),
    "authCreateAccountTitle": MessageLookupByLibrary.simpleMessage(
      "Create new account",
    ),
    "authCreateEmailHint": MessageLookupByLibrary.simpleMessage(
      "eman_focus@example.com",
    ),
    "authEmailInvalidError": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email, like name@example.com",
    ),
    "authEmailLabel": MessageLookupByLibrary.simpleMessage("Email or Username"),
    "authEmailRequiredError": MessageLookupByLibrary.simpleMessage(
      "Please enter your email address",
    ),
    "authErrorEmailInUse": MessageLookupByLibrary.simpleMessage(
      "This email is already registered.",
    ),
    "authErrorInvalidCredential": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password.",
    ),
    "authErrorInvalidEmail": MessageLookupByLibrary.simpleMessage(
      "The email address format is invalid.",
    ),
    "authErrorNetwork": MessageLookupByLibrary.simpleMessage(
      "Network error. Please check your connection and try again.",
    ),
    "authErrorNotConfigured": MessageLookupByLibrary.simpleMessage(
      "Firebase is not configured yet on this device.",
    ),
    "authErrorTooManyRequests": MessageLookupByLibrary.simpleMessage(
      "Too many attempts. Please wait a moment and try again.",
    ),
    "authErrorUnknown": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "authErrorUserDisabled": MessageLookupByLibrary.simpleMessage(
      "This account has been disabled.",
    ),
    "authErrorUserNotFound": MessageLookupByLibrary.simpleMessage(
      "No account found with this email.",
    ),
    "authErrorWeakPassword": MessageLookupByLibrary.simpleMessage(
      "Password is too weak. Use at least 6 characters.",
    ),
    "authErrorWrongPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect password. Please try again.",
    ),
    "authFirstTimePrompt": MessageLookupByLibrary.simpleMessage(
      "First time here? ",
    ),
    "authFullNameHint": MessageLookupByLibrary.simpleMessage("e.g. Eman Ahmed"),
    "authFullNameLabel": MessageLookupByLibrary.simpleMessage("Full Name"),
    "authGoogleBetaButton": MessageLookupByLibrary.simpleMessage(
      "Continue with Google (Beta)",
    ),
    "authGoogleBetaUnavailable": MessageLookupByLibrary.simpleMessage(
      "Google sign-in (Beta) is coming soon.",
    ),
    "authHaveAccountPrompt": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "authLoginBubble": MessageLookupByLibrary.simpleMessage(
      "You\'re back! Your Nivo was waiting for you.",
    ),
    "authLoginButton": MessageLookupByLibrary.simpleMessage("Sign In"),
    "authLoginEmailHint": MessageLookupByLibrary.simpleMessage(
      "name@example.com",
    ),
    "authLoginSubtitle": MessageLookupByLibrary.simpleMessage(
      "Sign in and continue your study.",
    ),
    "authLoginSuccessFallback": MessageLookupByLibrary.simpleMessage(
      "Signed in successfully!",
    ),
    "authLoginSuccessMessage": m0,
    "authLoginTitle": MessageLookupByLibrary.simpleMessage("Welcome back"),
    "authNameLengthError": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "authNameRequiredError": MessageLookupByLibrary.simpleMessage(
      "Please enter your full name",
    ),
    "authPasswordHint": MessageLookupByLibrary.simpleMessage("••••••••••"),
    "authPasswordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "authPasswordMinLengthError": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "authPasswordRequiredError": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "authRegisterSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Your account has been created successfully!",
    ),
    "authSignInLink": MessageLookupByLibrary.simpleMessage("Sign in"),
    "authSignedOutMessage": MessageLookupByLibrary.simpleMessage(
      "Signed out successfully.",
    ),
    "onboardingHaveAccount": MessageLookupByLibrary.simpleMessage(
      "I have an account",
    ),
    "onboardingHaveAccountMessage": MessageLookupByLibrary.simpleMessage(
      "Sign in will be available soon.",
    ),
    "onboardingIntroButton": MessageLookupByLibrary.simpleMessage(
      "Let me introduce myself",
    ),
    "onboardingIntroSubtitle": MessageLookupByLibrary.simpleMessage(
      "I\'m Nivo. I just woke up and don\'t remember everything yet.",
    ),
    "onboardingIntroTitle": MessageLookupByLibrary.simpleMessage(
      "Wait... who are you?",
    ),
    "onboardingStartedMessage": MessageLookupByLibrary.simpleMessage(
      "Nivo is ready to get started!",
    ),
    "onboardingStoryButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "onboardingStoryParagraph1": MessageLookupByLibrary.simpleMessage(
      "I was part of a project aimed at predicting people\'s performance and understanding what affects their focus.",
    ),
    "onboardingStoryParagraph2": MessageLookupByLibrary.simpleMessage(
      "But my predictions weren\'t always accurate, especially when someone achieved better than I expected. From there, I began to understand that numbers alone aren\'t enough to understand a human.",
    ),
    "onboardingStoryParagraph3": MessageLookupByLibrary.simpleMessage(
      "And there are things from the past I still don\'t remember... we\'ll discover them together gradually. Everyone gets their own Nivo.",
    ),
    "onboardingStoryTitle": MessageLookupByLibrary.simpleMessage(
      "My story in short",
    ),
    "onboardingWorkflowButton": MessageLookupByLibrary.simpleMessage(
      "Let\'s start",
    ),
    "onboardingWorkflowStep1": MessageLookupByLibrary.simpleMessage(
      "1. Tell me how you feel, and I\'ll give you an estimate",
    ),
    "onboardingWorkflowStep1Badge": MessageLookupByLibrary.simpleMessage(
      "Experimental",
    ),
    "onboardingWorkflowStep2": MessageLookupByLibrary.simpleMessage(
      "2. You focus, and I stay quiet with zero interruptions.",
    ),
    "onboardingWorkflowStep3": MessageLookupByLibrary.simpleMessage(
      "3. After the session, we compare my prediction with your real result.",
    ),
    "onboardingWorkflowTitle": MessageLookupByLibrary.simpleMessage(
      "What will we do together?",
    ),
  };
}
