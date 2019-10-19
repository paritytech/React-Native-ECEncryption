
# React-Native-EC-Encryption
[![npm version](https://badge.fury.io/js/react-native-ecencryption.svg)](https://badge.fury.io/js/react-native-ecencryption)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
## Description

This library is used for simple hardware-backed ECIES encryption and decryption on both iOS and Android. 

#### iOS

On iOS it use [Secure Enclave](https://developer.apple.com/documentation/security/certificate_key_and_trust_services/keys/storing_keys_in_the_secure_enclave?language=objc) for store the private key, and save public key to keychain. For getting the private key for decryption, user will need to enter his TouchID or FaceID if any is set.

Algorithm used: [ECIESEncryptionStandardX963SHA256AESGCM](https://developer.apple.com/documentation/security/kseckeyalgorithmeciesencryptionstandardx963sha256aesgcm?language=objc)

#### Android

On Android it use google [Tink](https://github.com/google/tink) for an easy application logic. It currently does not bound with Biometric Auth, but I will follow the discussion [here](https://github.com/google/tink/issues/211#issue-445852940)

Algorithm used: [ECIES_P256_HKDF_HMAC_SHA256_AES128_CTR_HMAC_SHA256](https://google.github.io/tink/javadoc/tink-android/1.0.0/com/google/crypto/tink/hybrid/HybridKeyTemplates.html)

## Getting started

`$ npm install react-native-ecencryption --save`

### Mostly automatic installation

`$ react-native link react-native-ecencryption`

## Usage

```javascript
import ECEncryption from 'react-native-ecencryption';

const encryptAndThenDecrypt = async () => {
  try {
    //Encrypt
    const cipherText = await ECEncryption.encrypt({
      data: 'some confidential data',
      label: '0x5Cc5dc62be3c95C771C14232e30358B398265deF' //any identical string
    });
    //Decrypt
    const clearText = await ECEncryption.decrypt({
      data: cipherText,
      label: '0x5Cc5dc62be3c95C771C14232e30358B398265deF' //the same identical string
    });
    console.log('decrypt result is ', clearText);
  } catch(e) {
    console.log(e);
  }
};
```

The library is originally used for [Parity Signer](https://github.com/paritytech/parity-signer).

## License
GNU General Public License v3.0
