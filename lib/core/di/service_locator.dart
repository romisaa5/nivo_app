import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:sanad_app/core/socket/socket_client.dart';
import 'package:sanad_app/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:sanad_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:sanad_app/features/chat/domain/repositories/chat_repository.dart';
import 'package:sanad_app/features/chat/domain/usecases/chat_usecases.dart';
import 'package:sanad_app/features/chat/presentation/cubit/chats_list/chats_list_cubit.dart';
import 'package:sanad_app/features/chat/presentation/cubit/chat_details/chat_details_cubit.dart';
import 'package:sanad_app/core/logic/available_time_slots/cubit/get_available_time_slots_cubit.dart';
import 'package:sanad_app/core/logic/available_time_slots/repos/get_available_time_slots_repo.dart';
import 'package:sanad_app/core/logic/lawer_services_prices/cubit/lawyer_consultation_service_pricing_cubit.dart';
import 'package:sanad_app/core/logic/lawer_services_prices/repos/get_lawyer_consultation_service_pricing.dart';
import 'package:sanad_app/core/logic/upload/upload_muitiple_files/logic/cubit/upload_multiple_files_cubit.dart';
import 'package:sanad_app/core/logic/upload/upload_muitiple_files/repos/upload_multiple_files_repo.dart';
import 'package:sanad_app/features/client_account/data/repo/client_account_repo.dart';
import 'package:sanad_app/features/client_account/presentation/logic/cubit/client_account_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sanad_app/core/meta/logic/cities/cities_cubit.dart';
import 'package:sanad_app/core/meta/logic/education_types/education_types_cubit.dart';
import 'package:sanad_app/core/meta/logic/experience_types/experience_types_cubit.dart';
import 'package:sanad_app/core/meta/logic/faculties/faculties_cubit.dart';
import 'package:sanad_app/core/meta/logic/governorates/governorates_cubit.dart';
import 'package:sanad_app/core/meta/logic/license_types/license_types_cubit.dart';
import 'package:sanad_app/core/meta/logic/syndicates/syndicates_cubit.dart';
import 'package:sanad_app/core/meta/logic/tags/tags_cubit.dart';
import 'package:sanad_app/core/meta/logic/universities/universities_cubit.dart';
import 'package:sanad_app/core/meta/repos/get_all_tags_repo.dart';
import 'package:sanad_app/core/meta/repos/get_cities_repo.dart';
import 'package:sanad_app/core/meta/repos/get_education_types_repo.dart';
import 'package:sanad_app/core/meta/repos/get_experience_types_repo.dart';
import 'package:sanad_app/core/meta/repos/get_faculties_repo.dart';
import 'package:sanad_app/core/meta/repos/get_governorates_repo.dart';
import 'package:sanad_app/core/meta/repos/get_license_types_repo.dart';
import 'package:sanad_app/core/meta/repos/get_syndicates_repo.dart';
import 'package:sanad_app/core/meta/repos/get_universities_repo.dart';
import 'package:sanad_app/core/helpers/secure_storage_helper.dart';
import 'package:sanad_app/core/helpers/shared_pref_helper.dart';
import 'package:sanad_app/core/network/api_client.dart';
import 'package:sanad_app/core/network/api_handler.dart';
import 'package:sanad_app/core/network/dio_factory.dart';
import 'package:sanad_app/core/network/network_manager.dart';
import 'package:sanad_app/core/services/storage/client_local_storage.dart';
import 'package:sanad_app/core/services/google_sign_in_service.dart';
import 'package:sanad_app/features/client_booking_consultation/data/repos/create_consultation_repo.dart';
import 'package:sanad_app/features/client_booking_consultation/presentation/logic/create_consultation/create_consultation_cubit.dart';
import 'package:sanad_app/features/client_bookings/data/repos/consultations_repo_impl.dart';
import 'package:sanad_app/features/client_bookings/presentation/logic/get_client_consultations/consultations_cubit.dart';
import 'package:sanad_app/features/client_consultation_details/data/repos/get_consultation_details_repo.dart';
import 'package:sanad_app/features/client_consultation_details/presentation/logic/get_consultation_details/get_consultation_details_cubit.dart';
import 'package:sanad_app/features/lawer_info/data/repos/get_all_educations_for_lawer_repo.dart';
import 'package:sanad_app/features/lawer_info/data/repos/get_all_experiences_for_lawer_repo.dart';
import 'package:sanad_app/features/lawer_info/data/repos/get_lawer_by_id_repo.dart';
import 'package:sanad_app/features/lawer_info/presentation/logic/get_educations/get_educations_cubit.dart';
import 'package:sanad_app/features/lawer_info/presentation/logic/get_experience/get_experience_cubit.dart';
import 'package:sanad_app/features/lawer_info/presentation/logic/lawer_by_id/lawyer_cubit.dart';
import 'package:sanad_app/features/lawyer_account/data/repo/work_schedule_repo.dart';
import 'package:sanad_app/features/lawyer_account/presentation/logic/work_schedule/work_schedule_cubit.dart';
import 'package:sanad_app/features/lawyer_registration/data/repos/create_education_repo.dart';
import 'package:sanad_app/features/lawyer_registration/data/repos/create_lawer_profile_repo.dart';
import 'package:sanad_app/features/lawyer_registration/data/repos/create_licenese_repo.dart';
import 'package:sanad_app/features/lawyer_registration/data/repos/create_multiple_experiences_repo.dart';
import 'package:sanad_app/features/lawyer_registration/presentation/logic/create_lawyer_profile/create_lawyer_profile_cubit.dart';
import 'package:sanad_app/features/lawyer_registration/presentation/logic/create_license/create_license_cubit.dart';
import 'package:sanad_app/features/lawyer_registration/presentation/logic/create_multiple_educations/create_multiple_educations_cubit.dart';
import 'package:sanad_app/features/lawyer_registration/presentation/logic/create_multiple_experiences/create_multiple_experiences_cubit.dart';
import 'package:sanad_app/features/onboarding/data/repos/google_login_repo.dart';
import 'package:sanad_app/features/onboarding/data/repos/nationality_repo.dart';
import 'package:sanad_app/features/onboarding/data/repos/onboard_user_repo.dart';
import 'package:sanad_app/features/onboarding/data/repos/upload_single_file_repo.dart';
import 'package:sanad_app/features/onboarding/presentation/logic/google_login/google_login_cubit.dart';
import 'package:sanad_app/features/onboarding/presentation/logic/nationality/nationality_cubit.dart';
import 'package:sanad_app/features/onboarding/presentation/logic/onboard_user/onboard_user_cubit.dart';
import 'package:sanad_app/features/onboarding/presentation/logic/upload_file/upload_file_cubit.dart';
import 'package:sanad_app/features/client_home/data/repos/client_home_repo.dart';
import 'package:sanad_app/features/client_home/presentation/logic/client_home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  final sharedPrefs = await SharedPrefHelper.init();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageHelper>(
    () => SecureStorageHelper(getIt<FlutterSecureStorage>()),
  );

  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  getIt.registerLazySingleton<NetworkManager>(() => NetworkManager());

  getIt.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await getIt<DioFactory>().createDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  getIt.registerLazySingleton<ApiHandler>(() => ApiHandler());
  getIt.registerLazySingleton<GoogleSignInService>(() => GoogleSignInService());

  getIt.registerLazySingleton<LawyerLocalStorage>(() => LawyerLocalStorage());
  getIt.registerLazySingleton<ClientLocalStorage>(() => ClientLocalStorage());

  getIt.registerLazySingleton<GoogleLoginRepo>(
    () => GoogleLoginRepo(getIt(), getIt(), getIt()),
  );

  getIt.registerFactory<GoogleLoginCubit>(
    () => GoogleLoginCubit(
      getIt<GoogleLoginRepo>(),
      getIt<GoogleSignInService>(),
    ),
  );

  getIt.registerLazySingleton<GetGovernoratesRepo>(
    () => GetGovernoratesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerLazySingleton<GetCitiesRepo>(
    () => GetCitiesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerLazySingleton<GetUniversitiesRepo>(
    () => GetUniversitiesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerLazySingleton<GetSyndicatesRepo>(
    () => GetSyndicatesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerFactory<GovernoratesCubit>(
    () => GovernoratesCubit(getIt<GetGovernoratesRepo>()),
  );

  getIt.registerFactory<CitiesCubit>(() => CitiesCubit(getIt<GetCitiesRepo>()));

  getIt.registerFactory<UniversitiesCubit>(
    () => UniversitiesCubit(getIt<GetUniversitiesRepo>()),
  );

  getIt.registerFactory<SyndicatesCubit>(
    () => SyndicatesCubit(getIt<GetSyndicatesRepo>()),
  );
  getIt.registerLazySingleton<OnboardUserRepo>(
    () => OnboardUserRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<OnboardUserCubit>(
    () => OnboardUserCubit(getIt<OnboardUserRepo>()),
  );
  getIt.registerLazySingleton<GetAllTagsRepo>(
    () => GetAllTagsRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<TagsCubit>(() => TagsCubit(getIt<GetAllTagsRepo>()));

  getIt.registerLazySingleton<UploadFileRepo>(
    () => UploadFileRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<UploadFileCubit>(
    () => UploadFileCubit(getIt<UploadFileRepo>()),
  );

  getIt.registerLazySingleton<CreateLawyerProfileRepo>(
    () => CreateLawyerProfileRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<CreateLawyerProfileCubit>(
    () => CreateLawyerProfileCubit(getIt<CreateLawyerProfileRepo>()),
  );
  getIt.registerLazySingleton<EducationRepo>(
    () => EducationRepo(getIt<ApiHandler>(), getIt<ApiClient>()),
  );
  getIt.registerFactory<CreateMultipleEducationsCubit>(
    () => CreateMultipleEducationsCubit(getIt<EducationRepo>()),
  );
  getIt.registerLazySingleton<CreateMultipleExperiencesRepo>(
    () =>
        CreateMultipleExperiencesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<CreateMultipleExperiencesCubit>(
    () =>
        CreateMultipleExperiencesCubit(getIt<CreateMultipleExperiencesRepo>()),
  );

  getIt.registerLazySingleton<CreateLiceneseRepo>(
    () => CreateLiceneseRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<CreateLicenseCubit>(
    () => CreateLicenseCubit(getIt<CreateLiceneseRepo>()),
  );

  getIt.registerLazySingleton<WorkScheduleRepo>(
    () => WorkScheduleRepo(
      apiClient: getIt<ApiClient>(),
      apiHandler: getIt<ApiHandler>(),
    ),
  );
  getIt.registerFactory<WorkScheduleCubit>(
    () => WorkScheduleCubit(getIt<WorkScheduleRepo>()),
  );

  getIt.registerLazySingleton<GetEducationTypesRepo>(
    () => GetEducationTypesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<EducationTypesCubit>(
    () => EducationTypesCubit(getIt<GetEducationTypesRepo>()),
  );

  getIt.registerLazySingleton<GetExperienceTypesRepo>(
    () => GetExperienceTypesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<ExperienceTypesCubit>(
    () => ExperienceTypesCubit(getIt<GetExperienceTypesRepo>()),
  );

  getIt.registerLazySingleton<GetFacultiesRepo>(
    () => GetFacultiesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<FacultiesCubit>(
    () => FacultiesCubit(getIt<GetFacultiesRepo>()),
  );

  getIt.registerLazySingleton<GetLicenseTypesRepo>(
    () => GetLicenseTypesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<LicenseTypesCubit>(
    () => LicenseTypesCubit(getIt<GetLicenseTypesRepo>()),
  );
  getIt.registerLazySingleton<ClientAccountRepo>(
    () => ClientAccountRepo(
      apiClient: getIt<ApiClient>(),
      apiHandler: getIt<ApiHandler>(),
    ),
  );
  getIt.registerFactory<ClientAccountCubit>(
    () => ClientAccountCubit(getIt<ClientAccountRepo>()),
  );

  getIt.registerLazySingleton<NationalityRepo>(
    () => NationalityRepo(getIt<ApiClient>()),
  );
  getIt.registerFactory<NationalityCubit>(
    () => NationalityCubit(getIt<NationalityRepo>()),
  );
  getIt.registerLazySingleton<ClientHomeRepo>(
    () => ClientHomeRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<ClientHomeCubit>(
    () => ClientHomeCubit(getIt<ClientHomeRepo>()),
  );
  getIt.registerLazySingleton<GetLawerByIdRepo>(
    () => GetLawerByIdRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<LawyerCubit>(
    () => LawyerCubit(getIt<GetLawerByIdRepo>()),
  );
  getIt.registerLazySingleton<GetAllEducationsForLawerRepo>(
    () => GetAllEducationsForLawerRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<GetEducationsCubit>(
    () => GetEducationsCubit(getIt<GetAllEducationsForLawerRepo>()),
  );
  getIt.registerLazySingleton<GetAllExperiencesForLawerRepo>(
    () =>
        GetAllExperiencesForLawerRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<ExperienceCubit>(
    () => ExperienceCubit(getIt<GetAllExperiencesForLawerRepo>()),
  );

  getIt.registerLazySingleton<ConsultationsRepoImpl>(
    () => ConsultationsRepoImpl(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<ConsultationsCubit>(
    () => ConsultationsCubit(getIt<ConsultationsRepoImpl>()),
  );

  getIt.registerLazySingleton<GetConsultationDetailsRepo>(
    () => GetConsultationDetailsRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<GetConsultationDetailsCubit>(
    () => GetConsultationDetailsCubit(getIt<GetConsultationDetailsRepo>()),
  );

  getIt.registerLazySingleton<CreateConsultationRepo>(
    () => CreateConsultationRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerFactory<CreateConsultationCubit>(
    () => CreateConsultationCubit(getIt<CreateConsultationRepo>()),
  );

  getIt.registerLazySingleton<UploadMultipleFilesRepo>(
    () => UploadMultipleFilesRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );

  getIt.registerFactory<UploadMultipleFilesCubit>(
    () => UploadMultipleFilesCubit(getIt<UploadMultipleFilesRepo>()),
  );
  getIt.registerLazySingleton<GetLawyerConsultationServicePricingRepo>(
    () => GetLawyerConsultationServicePricingRepo(
      getIt<ApiClient>(),
      getIt<ApiHandler>(),
    ),
  );
  getIt.registerFactory<LawyerConsultationServicePricingCubit>(
    () => LawyerConsultationServicePricingCubit(
      getIt<GetLawyerConsultationServicePricingRepo>(),
    ),
  );
  getIt.registerLazySingleton<GetAvailableTimeSlotsRepo>(
    () => GetAvailableTimeSlotsRepo(getIt<ApiClient>(), getIt<ApiHandler>()),
  );
  getIt.registerFactory<GetAvailableTimeSlotsCubit>(
    () => GetAvailableTimeSlotsCubit(getIt<GetAvailableTimeSlotsRepo>()),
  );

  // Chat Module
  getIt.registerLazySingleton<SocketClient>(() => SocketClient()..connect());

  getIt.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(
      dio: getIt<Dio>(),
      socketClient: getIt<SocketClient>(),
    ),
  );

  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(remoteDataSource: getIt<ChatRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetChatsUseCase>(() => GetChatsUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<JoinChatUseCase>(() => JoinChatUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<LeaveChatUseCase>(() => LeaveChatUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<SendMessageUseCase>(() => SendMessageUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<GetMessagesUseCase>(() => GetMessagesUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<ReadMessagesUseCase>(() => ReadMessagesUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<DeliverMessagesUseCase>(() => DeliverMessagesUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<SearchMessagesUseCase>(() => SearchMessagesUseCase(getIt<ChatRepository>()));
  getIt.registerLazySingleton<ListenToChatSocketEventsUseCase>(() => ListenToChatSocketEventsUseCase(getIt<ChatRepository>()));

  getIt.registerFactory<ChatsListCubit>(
    () => ChatsListCubit(getIt<GetChatsUseCase>()),
  );
  
  getIt.registerFactoryParam<ChatDetailsCubit, String, void>(
    (chatId, _) => ChatDetailsCubit(
      chatId: chatId,
      joinChat: getIt<JoinChatUseCase>(),
      leaveChat: getIt<LeaveChatUseCase>(),
      sendMessage: getIt<SendMessageUseCase>(),
      getMessages: getIt<GetMessagesUseCase>(),
      readMessages: getIt<ReadMessagesUseCase>(),
      deliverMessages: getIt<DeliverMessagesUseCase>(),
      listenEvents: getIt<ListenToChatSocketEventsUseCase>(),
    ),
  );
}
