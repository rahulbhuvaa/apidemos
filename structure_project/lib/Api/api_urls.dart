
import 'package:structure_project/Pref/share_prefrence.dart';

class ApiUrls {
  // static String baseURL = "http://192.168.0.222:8002/"; //local
  static String baseURL =
      PreferenceUtils.getStringValue( "baseUrl").isNotEmpty
          ? PreferenceUtils.getStringValue( "baseUrl")
          : "https://www.reachassuree.com/"; //live
  // static String baseURL = "http://chocolate.setubandh.com/"; //live
  //static String baseURL = "http://192.168.0.221:8002/"; //live local
  static String loginUrl = "${baseURL}api/login";
  static String logOutUrl = "${baseURL}api/logout";
  static String searchCity = "${baseURL}api/search-city";
  static String searchFamilyGroup = "${baseURL}api/search-family-group";
  static String searchArea = "${baseURL}api/search-area";
  static String searchGender = "${baseURL}api/search-gender";
  static String searchBusinessType = "${baseURL}api/search-business";
  static String searchRelationUrl = "${baseURL}api/search-relation";
  static String searchDocumentTypeUrl = "${baseURL}api/search-document-type";
  static String searchDocumentNameUrl = "${baseURL}api/search-document-name";
  static String searchDivisionUrl = "${baseURL}api/search-division";
  static String searchInsueranceUrl = "${baseURL}api/search-insurance-company";
  static String searchModeUrl = "${baseURL}api/search-mode";
  static String searchBrokerUrl = "${baseURL}api/search-broker";
  static String searchAgencyNameUrl = "${baseURL}api/search-agency";
  static String searchAgencyLevelNameUrl = "${baseURL}api/search-agency-level";
  static String searchSubAgentUrl = "${baseURL}api/search-sub-agent";
  static String searchPaymentModeUrl = "${baseURL}api/search-payment-mode";
  static String verifyAgentCodeUrl = "${baseURL}api/verify-agent-code";
  static String searchFamilyHeadUrl = "${baseURL}api/search-family-head";
  static String searchFamilyMemberUrl = "${baseURL}api/search-family-member";
  static String selectClientUrl = "${baseURL}api/search-clients";
  static String clientStatusUrl = "${baseURL}api/search-client-status";
  static String searchSegmentUrl = "${baseURL}api/search-segment";
  static String saveFamilyMemberUrl = "${baseURL}api/family-member-save";
  static String genderUrl = "${baseURL}api/get-marriage-status";
  static String joinWithUsUrl = "${baseURL}api/get-join-with-us";
  static String cityMasterUrl = "${baseURL}api/master-city-save";
  static String tpaMasterSaveUrl =
      "${baseURL}api/master-third-party-administrat-save";
  static String areaMasterUrl = "${baseURL}api/master-area-save";
  static String genderMasterUrl = "${baseURL}api/master-gender-save";
  static String clientStatusMasterUrl =
      "${baseURL}api/master-client-status-save";
  static String businessMasterUrl = "${baseURL}api/master-business-save";
  static String marriageStatusMasterUrl =
      "${baseURL}api/master-marriage-status-save";
  static String joinWithUsMasterUrl = "${baseURL}api/master-join-with-us-save";
  static String relationMasterUrl = "${baseURL}api/master-relation-save";
  static String documentTypeMasterUrl =
      "${baseURL}api/master-document-type-save";
  static String documentNameMasterUrl =
      "${baseURL}api/master-document-name-save";
  static String insurenceCompanyMasterUrl =
      "${baseURL}api/master-insurance-company-save";
  static String brokerMasterUrl = "${baseURL}api/master-broker-save";
  static String segmentMasterUrl = "${baseURL}api/master-segment-save";
  static String agencyLevelMasterUrl = "${baseURL}api/master-agency-level-save";
  static String agencyMasterUrl = "${baseURL}api/master-agency-save";
  static String subAgentMasterUrl = "${baseURL}api/master-sub-agent-save";
  static String paymentMasterUrl = "${baseURL}api/master-payment-mode-save";
  static String insurancePlanMasterUrl =
      "${baseURL}api/master-life-insurance-plan-save";
  static String lifePolicyStatusMasterUrl =
      "${baseURL}api/master-life-policy-status-save";
  static String investmentTypeMasterUrl =
      "${baseURL}api/master-investment-type-save";
  static String investedPartyMasterUrl =
      "${baseURL}api/master-invested-party-save";
  static String branchMasterUrl = "${baseURL}api/master-branch-save";
  static String claimTypeMasterUrl = "${baseURL}api/master-claim-type-save";
  static String targetDepartMentMasterUrl =
      "${baseURL}api/master-target-department-save";
  static String riskTermCategotyMasterUrl =
      "${baseURL}api/master-risk-term-category-save";
  static String targetFactorMasterUrl =
      "${baseURL}api/master-target-factor-save";
  static String searchTargetDepartMentUrl =
      "${baseURL}api/search-target-department";
  static String cityMastershowUrl = "${baseURL}api/master-cities";
  static String tpaMasterShowUrl =
      "${baseURL}api/master-third-party-administrator";
  static String areaMastershowUrl = "${baseURL}api/master-areas";
  static String genderMastershowUrl = "${baseURL}api/master-genders";
  static String clientStatusMastershowUrl =
      "${baseURL}api/master-client-status";
  static String businessMastershowUrl = "${baseURL}api/master-businesses";
  static String marriageMastershowUrl = "${baseURL}api/master-marriage-status";
  static String joinWithUsMastershowUrl = "${baseURL}api/master-join-with-us";
  static String relationMastershowUrl = "${baseURL}api/master-relations";
  static String documentTypeMastershowUrl =
      "${baseURL}api/master-document-types";
  static String documentNameMastershowUrl =
      "${baseURL}api/master-document-names";
  static String divisionMastershowUrl = "${baseURL}api/master-divisions";
  static String segmentMastershowUrl = "${baseURL}api/master-segments";
  static String insuranceCompanyMastershowUrl =
      "${baseURL}api/master-insurance-companies";
  static String modeMastershowUrl = "${baseURL}api/master-modes";
  static String brokerMastershowUrl = "${baseURL}api/master-brokers";
  static String agencyLevelMastershowUrl = "${baseURL}api/master-agency-levels";
  static String deleteDocumentUrl = "${baseURL}api/delete-client-document";
  static String agencyMastershowUrl = "${baseURL}api/master-agencies";
  static String subAgentMastershowUrl = "${baseURL}api/master-sub-agents";
  static String paymentModeMastershowUrl = "${baseURL}api/master-payment-modes";
  static String branchMastershowUrl = "${baseURL}api/master-branches";
  static String lifeInsurancePlanMastershowUrl =
      "${baseURL}api/master-life-insurance-plans";
  static String lifePolicyStatusMastershowUrl =
      "${baseURL}api/master-life-policy-status";
  static String investmentTypeMastershowUrl =
      "${baseURL}api/master-investment-types";
  static String investedPartyMastershowUrl =
      "${baseURL}api/master-invested-parties";
  static String claimTypeMastershowUrl = "${baseURL}api/master-client-status";
  static String targetDepartmentMastershowUrl =
      "${baseURL}api/master-target-departments";
  static String targetFactorMastershowUrl =
      "${baseURL}api/master-target-factors";
  static String riskTermCategoryMastershowUrl =
      "${baseURL}api/master-risk-term-categories";
  static String cityStatusUrl = "${baseURL}api/master-change-city-status";
  static String tpaStatusUpdateUrl =
      "${baseURL}api/master-change-third-party-administrat-status";
  static String areaStatusUrl = "${baseURL}api/master-change-area-status";
  static String genderStatusUrl = "${baseURL}api/master-change-gender-status";
  static String clientStatusCheckUrl =
      "${baseURL}api/master-change-client-status";
  static String businessStatusUrl =
      "${baseURL}api/master-change-business-status";
  static String marriageStatusUrl =
      "${baseURL}api/master-change-marriage-status";
  static String joinWithUsStatusUrl =
      "${baseURL}api/master-change-join-with-us-status";
  static String relationStatusUrl =
      "${baseURL}api/master-change-relation-status";
  static String documentTypeStatusUrl =
      "${baseURL}api/master-change-document-type-status";
  static String documentNameStatusUrl =
      "${baseURL}api/master-change-document-name-status";
  static String divisionStatusUrl =
      "${baseURL}api/master-change-division-status";
  static String segmentStatusUrl = "${baseURL}api/master-change-segment-status";
  static String insuranceStatusUrl =
      "${baseURL}api/master-change-insurance-company-status";
  static String modeStatusUrl = "${baseURL}api/master-change-mode-status";
  static String brokerStatusUrl = "${baseURL}api/master-change-broker-status";
  static String agencyLevelStatusUrl =
      "${baseURL}api/master-change-agency-level-status";
  static String agencyStatusUrl = "${baseURL}api/master-change-agency-status";
  static String subAgentStatusUrl =
      "${baseURL}api/master-change-sub-agent-status";
  static String paymentStatusUrl =
      "${baseURL}api/master-change-payment-mode-status";
  static String branchStatusUrl = "${baseURL}api/master-change-branch-status";
  static String lifeInsurancePlanStatusUrl =
      "${baseURL}api/master-change-life-insurance-plan-status";
  static String lifePolicyStatusUrl =
      "${baseURL}api/master-change-life-policy-status";
  static String investmentTypeSttausUrl =
      "${baseURL}api/master-change-investment-type-status";
  static String investedStatusUrl =
      "${baseURL}api/master-change-invested-party-status";
  static String claimStatusUrl =
      "${baseURL}api/master-change-claim-type-status";
  static String targetDepartmentStatusUrl =
      "${baseURL}api/master-change-target-department-status";
  static String targetFactorStatusUrl =
      "${baseURL}api/master-change-target-factor-status";
  static String riskTermCategoryStatusUrl =
      "${baseURL}api/master-change-risk-term-category-status";
  static String familyHeadSaveUrl = "${baseURL}api/family-head-save";
  static String firmSaveUrl = "${baseURL}api/firm-save";
  static String generalPolicySavaUrl = "${baseURL}api/general-policy-save";
  static String clientDocumentSaveUrl = "${baseURL}api/client-document-save";
  static String searchBranchUrl = "${baseURL}api/search-branch";
  static String searchLifePolicyStatusUrl =
      "${baseURL}api/search-life-policy-status";
  static String searchLifeInsurancePlanUrl =
      "${baseURL}api/search-life-insurance-plan";
  static String lifeInsurancePolicyUrl = "${baseURL}api/life-policy-save";
  static String manageClientsUrl = "${baseURL}api/clients";
  static String deleteClientsUrl = "${baseURL}api/delete-client";
  static String restoreClientUrl = "${baseURL}api/restore-client";
  static String clientByIdUrl = "${baseURL}api/client-by-id";
  static String deletePolicyUrl = "${baseURL}api/delete-general-policy";
  static String restorePolicyUrl = "${baseURL}api/restore-general-policy";
  static String policyByIdUrl = "${baseURL}api/general-policy-by-id";
  static String generalPolicyUrl = "${baseURL}api/general-policies";
  static String lifePoliciesUrl = "${baseURL}api/life-policies";
  static String deletLifePoliciesUrl = "${baseURL}api/delete-life-policy";
  static String restoreLifePoliciesUrl = "${baseURL}api/restore-life-policy";
  static String lifePoliciesByIdUrl = "${baseURL}api/life-policy-by-id";
  static String searchInvestmentTypeUrl =
      "${baseURL}api/search-investment-type";
  static String searchInvestedPartyUrl =
      "${baseURL}api/search-investment-party-name";
  static String saveInvestmentUrl = "${baseURL}api/save-investment";
  static String investmentsUrl = "${baseURL}api/investments";
  static String deleteInvestmentUrl = "${baseURL}api/delete-investment";
  static String investmentByIdUrl = "${baseURL}api/investment-by-id";
  static String dashboardTileUrl = "${baseURL}api/dashboard";
  static String familyGroupSaveUrl = "${baseURL}api/family-group-save";
  static String familyGroupShowUrl = "${baseURL}api/family-groups";
  static String changeFamilyGroupStatusUrl =
      "${baseURL}api/change-family-group-status";
  static String clientDocumentListsUrl = "${baseURL}api/client-document-lists";
  static String changeClientDocumentStatusUrl =
      "${baseURL}api/change-client-document-status";
  static String getClientDocumentIdUrl = "${baseURL}api/get-client-document-id";
  static String manageRenewalListUrl = "${baseURL}api/manage-renewal-list";
  static String generalRenewalPolicyUrl =
      "${baseURL}api/general-renewal-policy";
  static String saveUpdateDivisionMater = "${baseURL}api/master-division-save";
  static String divisionStatus = "${baseURL}api/master-change-division-status";
  static String selectGeneralPolicyById = "${baseURL}api/select-general-policy-by-id";
  static String searchLifeInsurancePlanNumberUrl = "${baseURL}api/search-life-insurance-plan-number";
  static String sendOtpUrl = "${baseURL}api/verify-email";
  static String otpVarifyUrl = "${baseURL}api/otp-verify";
  static String changePasswordUrl = "${baseURL}api/forgot-password";
    static String getFamilyHeadData = "${baseURL}api/get-family-head";
    static String saveMode = "${baseURL}api/master-mode-save";
    static String getUsers = "${baseURL}api/agent-users";
    static String changeUserStatus = "${baseURL}api/change-agent-user-status";
    static String deleteUser = "${baseURL}api/delete-agent-user";
    static String searchUser = "${baseURL}api/search-agent-user";
    static String saveUser = "${baseURL}api/agent-user-save";
}
