class SharedPrefKeys {
  SharedPrefKeys._();

  // Onboarding Keys
  static const String onboardingCompleted = 'onboardingCompleted';

  // Firebase Auth Session Cache Keys (non-sensitive metadata only)
  static const String isAuthenticated = 'is_authenticated';
  static const String firebaseUid = 'firebase_uid';
  static const String userEmail = 'user_email';
  static const String userDisplayName = 'user_display_name';

  // lawer Keys
  static const lawyerId = 'lawyer_id';
  static const lawyerFirstName = 'lawyer_first_name';
  static const lawyerLastName = 'lawyer_last_name';
  static const lawyerEmail = 'lawyer_email';
  static const lawyerImageUrl = 'lawyer_image_url';
  static const lawyerDateOfBirth = 'lawyer_date_of_birth';
  static const lawyerIsEmailVerified = 'lawyer_is_email_verified';
  static const lawyerCreatedAt = 'lawyer_created_at';
  static const lawyerRoleId = 'lawyer_role_id';
  static const lawyerRoleName = 'lawyer_role_name';
  static const isRegistered = 'is_registered';

  // client Keys
  static const clientId = 'client_id';
  static const clientFirstName = 'client_first_name';
  static const clientLastName = 'client_last_name';
  static const clientEmail = 'client_email';
  static const clientImageUrl = 'client_image_url';
  static const clientDateOfBirth = 'client_date_of_birth';
  static const clientIsEmailVerified = 'client_is_email_verified';
  static const clientCreatedAt = 'client_created_at';
  static const clientRoleId = 'client_role_id';
  static const clientRoleName = 'client_role_name';

  static const String lawyerGeneralInfo = 'lawyer_general_info';
  static const String lawyerEducations = 'lawyer_educations';
  static const String lawyerExperiences = 'lawyer_experiences';
  static const String lawyerLicense = 'lawyer_license';
}
