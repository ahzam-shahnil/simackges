import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// // banner and interstitial ad ids admob
// const kOfferBannerAdId = 'ca-app-pub-2072140483759075/9060793068';
// const kDetailBannerAdId = 'ca-app-pub-2072140483759075/3382048831';
// const kAppAdId = "ca-app-pub-2072140483759075~5380198857";
// const kInterstitialAdId = 'ca-app-pub-2072140483759075/3616415762';

//  banner and interstitial ads ids facebook
const kOfferBannerFbAdId = "201660814930243_205316031231388";
const kDetailBannerFbAdId = "201660814930243_209091514187173";
const kInterstDetailFbAdId = "201660814930243_208142980948693";
//Address of app in google play
const kAppAddress =
    'https://play.google.com/store/apps/details?id=com.proApps.simackges';

// routes text
const kHomeRoute = 'home';
const kOfferRoute = 'offer';
const kDetailRoute = 'details';
const kPackageScreen = 'package';

// text for app
const kAppTitleText = 'Simackges';
const kAboutDialogText =
    'This app provides latest Call, SMS, Internet and other offers of all networks available in Pakistan.\nAll the packages, logos and pictures used in this app are properties of Pakistani networks (JAZZ, UFONE, TELENOR, ZONG). \nIf you want to remove any sensitive or copyrighted data from our app please feel free to contact us.\n\nAll packages are updated at the end of each month.Help us by rating 5 stars and also give your valuable feedback, love and support...\n\nEmail: shahnil.ahzam@gmail.com';
const kPrivacyUrl = 'https://sites.google.com/view/simackges/privacy-policy';
const kJazzWaridText = 'Jazz + Warid ';
const kPackageText = 'Choose your Network';
const kFavouriteText = "Favourite Offers";
const kOnNetText = 'OnNet Mins';
const kOffNetText = 'OffNet Mins';
const kConfirmText = 'Would you like to subscribe to this package?';
const kErrorText = 'Activation Code not Available.';
const kSmsItemText = 'SMS';
const kUnlimitedText = 'Unlimited';
const kMBsItemText = 'Mbs';
const kSMSOfferName = 'SMS Offers';
const kInternetOfferName = 'Internet Offers';
const kOtherOfferName = 'Other Offers';

//text for details Screen
const kOffNet = 'Off-Net';
const kOnNet = 'On-Net';
const kValidity = 'Validity';
const kSMS = 'SMS';
const kInternet = 'Internet';
const kPrice = 'Price';
const kActivation = 'Activation';
const kDeactivation = 'De-Activation';

//basic code text
const kCheckBalanceText = 'Check Remaining Balance';
const kCheckSMS = 'Check Remaining SMS';
const kCheckMinutes = 'Check Remaining Minutes';
const kCheckInternet = 'Check Remaining Internet';
const kCardRecharge = 'Card Recharge';
const kGetLoan = 'Get Advance Balance';
const kBalanceShare = 'Balance Share';

// Alert Box title
const kJazzCardR = 'Jazz + Warid';
const kUfoneCardR = 'Ufone';
const kZongCardR = 'Zong';
const kTelenorCardR = 'Telenor';
const kCardRechargeHint = 'Enter Card Number Here (14 Digits)';
const kShareBalanceHint = 'Enter Recipient Mobile No here:';
const kBalanceAmountHint = 'Enter Amount Here (Rs 15 - 200)';
const kUfoneDialogText = 'Send an Empty Message to 606';

//code for jazz and warid number check
const kJazzNumCode = '*99#';
const kWaridNumCode = '*321*8*1*3#';
const kUfoneShareCode = '828';
const kUfoneRSmsCode = '606';

// colors for app
const kJazzColor = Color(0xFF89060B);
const kZongColor = Color(0xff73AB28);
const kUfoneColor = Color(0xffFC6E00);
const kTelenorColor = Color(0xff00A4F0);
const kPtclColor = Color(0xff006115);

// image address of assets
const kDesignImgAddress = 'assets/images/Design.png';

const kJazzImgAddress = 'assets/images/jazzlogo.png';
const kJazzDeviceAddress = 'assets/images/jazzdevice.jpg';
const kJazzNetSimAddress = 'assets/images/jnetsim.jpg';
const kJazzPostPayAddress = 'assets/images/jpostpay.png';

const kWaridImgAddress = 'assets/images/waridlogo.png';

const kTelenorImgAddress = 'assets/images/telenorlogo.png';
const kTelenorBroadAddress = 'assets/images/tbroad.jpg';
const kTelenorNetSimAddress = 'assets/images/tnetsim.jpg';
const kTelenorPostPayAddress = 'assets/images/tpostpay.png';

const kZongImgAddress = 'assets/images/zonglogo.png';
const kZongPostPayAddress = 'assets/images/zpostpay.png';
const kZongNetSimAddress = 'assets/images/znetsim.jpg';
const kZongBroadAddress = 'assets/images/zbroad.jpg';

const kPtclImgAddress = 'assets/images/ptcl.png';
const kPtclBroadAddress = 'assets/images/ptclbroad.jpg';
const kPtclEvoAddress = 'assets/images/ptclevo9_3.jpg';
const kPtclNitroAddress = 'assets/images/ptclnitro.jpg';
const kPtclPhoneAddress = 'assets/images/ptcltel.jpg';
const kPtclCarfiAddress = 'assets/images/ptclcarfi.png';
const kPtclCharjiAddress = 'assets/images/ptclcharji.png';
const kPtclTvAddress = 'assets/images/ptcltv.png';

const kUfoneImgAddress = 'assets/images/ufonelogo.png';
const kUfonePostPayAddress = 'assets/images/upostpay.png';
const kUfonePrePayAddress = 'assets/images/uprepay.png';
const kUthAddress = 'assets/images/uth.jpg';

// icons for offers
const kCallIcon = Icons.phone;
const kMsgIcon = Icons.sms_rounded;
const kWifiicon = Icons.wifi;
const kLocationIcon = Icons.location_on_outlined;
const kOtherIcon = Icons.card_giftcard_outlined;

// text style
var kOfferTextStyle = GoogleFonts.ptSans(
    fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500);
const kPackageTextStyle =
    TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold);
var kWhiteTextStyle = TextStyle(color: Colors.grey[50]);
var kGreenTextStyle = TextStyle(color: kZongColor, fontWeight: FontWeight.w700);
var kGreenHeadingStyle = GoogleFonts.ptSans(
    color: kZongColor, fontWeight: FontWeight.w600, fontSize: 23);
