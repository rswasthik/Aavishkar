import 'package:get/get.dart';

class LocalrString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Welcome': 'Welcome to ',
          'name': 'Raithara Sahayaka',
          'message': 'The App that connect you to farming resources'
        },
        'kn_IN': {
          'Welcome': 'ಸ್ವಾಗತ',
          'name': 'ರೈತ ಸಹಾಯಕ',
          'message': 'ಕೃಷಿ ಸಂಪನ್ಮೂಲಗಳಿಗೆ ನಿಮ್ಮನ್ನು ಸಂಪರ್ಕಿಸುವ ಅಪ್ಲಿಕೇಶನ್'
        },
        'hi_IN': {
          'Welcome': 'आपका स्वागत है',
          'name': 'रैथारा सहायक',
          'message': 'ऐप जो आपको कृषि संसाधनों से जोड़ता है'
        }
      };
}
