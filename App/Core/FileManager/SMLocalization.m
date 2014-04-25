//
//  HLMLocalization.m
//  HLMZiniMini
//
//  Created by huangxinping on 3/3/14.
//  Copyright (c) 2014 sharemerge. All rights reserved.
//

#import "SMLocalization.h"

NSString *SMLocalization(NSString *key) {
	NSString *localization = [SMLanguageManager localizedString:key];

	if (localization) {
		return localization;
	}
	else {
		if ([[SMLanguageManager selectedLanguage] isEqualToString:kSMEnglish]) {
			return @"Localization error";
		}
		else {
			return @"本地化错误";
		}
	}
	return nil;
}
