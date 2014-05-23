/**
 *  HLMLocalization.h
 *  ShareMerge
 *
 *  Created by huangxp on 2014-03-03.
 *
 *  本地化操作
 *
 *  Copyright (c) www.sharemerge.com All rights reserved.
 */

/** @file */    // Doxygen marker

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
