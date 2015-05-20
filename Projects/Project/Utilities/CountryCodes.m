#import "CountryCodes.h"

static CountryCodes *shareCountryCodes_ = nil;

@interface NSString(StartsWith)
- (BOOL) startsWith:(NSString *) prefix;
@end

@implementation NSString(StartsWith)
- (BOOL) startsWith:(NSString *) prefix{
	return [self rangeOfString:prefix].location == 0;
}
@end

@implementation CountryCodes

+(CountryCodes *) shareCountryCodes{
    if (!shareCountryCodes_) {
        shareCountryCodes_ = [[CountryCodes alloc] init];
    }
    return shareCountryCodes_;
}

- (id) init{
    self = [super init];
    
    if ( self ) {
		NSString *jsonStr = @"{\"AF\":[\"Afghanistan\",\"93\"],\"AL\":[\"Albania\",\"355\"],\"DZ\":[\"Algeria\",\"213\"],\"AS\":[\"American Samoa\",\"1684\"],\"AD\":[\"Andorra\",\"376\"],\"AO\":[\"Angola\",\"244\"],\"AI\":[\"Anguilla\",\"1264\"],\"AQ\":[\"Antarctica\",\"672\"],\"AG\":[\"Antigua and Barbuda\",\"1268\"],\"AR\":[\"Argentina\",\"54\"],\"AM\":[\"Armenia\",\"374\"],\"AW\":[\"Aruba\",\"297\"],\"AU\":[\"Australia\",\"61\"],\"AT\":[\"Austria\",\"43\"],\"AZ\":[\"Azerbaijan\",\"994\"],\"BS\":[\"Bahamas\",\"1242\"],\"BH\":[\"Bahrain\",\"973\"],\"BD\":[\"Bangladesh\",\"880\"],\"BB\":[\"Barbados\",\"1246\"],\"BY\":[\"Belarus\",\"375\"],\"BE\":[\"Belgium\",\"32\"],\"BZ\":[\"Belize\",\"501\"],\"BJ\":[\"Benin\",\"229\"],\"BM\":[\"Bermuda\",\"1441\"],\"BT\":[\"Bhutan\",\"975\"],\"BO\":[\"Bolivia\",\"591\"],\"BA\":[\"Bosnia and Herzegovina\",\"387\"],\"BW\":[\"Botswana\",\"267\"],\"BR\":[\"Brazil\",\"55\"],\"VG\":[\"Virgin Islands, British\",\"1284\"],\"BN\":[\"Brunei Darussalam\",\"673\"],\"BG\":[\"Bulgaria\",\"359\"],\"BF\":[\"Burkina Faso\",\"226\"],\"MM\":[\"Myanmar\",\"95\"],\"BI\":[\"Burundi\",\"257\"],\"KH\":[\"Cambodia\",\"855\"],\"CM\":[\"Cameroon\",\"237\"],\"CA\":[\"Canada\",\"1\"],\"CV\":[\"Cape Verde\",\"238\"],\"KY\":[\"Cayman Islands\",\"1345\"],\"CF\":[\"Central African Republic\",\"236\"],\"TD\":[\"Chad\",\"235\"],\"CL\":[\"Chile\",\"56\"],\"CN\":[\"China\",\"86\"],\"CX\":[\"Christmas Island\",\"61\"],\"CC\":[\"Cocos (Keeling) Islands\",\"61\"],\"CO\":[\"Colombia\",\"57\"],\"KM\":[\"Comoros\",\"269\"],\"CK\":[\"Cook Islands\",\"682\"],\"CR\":[\"Costa Rica\",\"506\"],\"HR\":[\"Croatia\",\"385\"],\"CU\":[\"Cuba\",\"53\"],\"CY\":[\"Cyprus\",\"357\"],\"CZ\":[\"Czech Republic\",\"420\"],\"CD\":[\"Congo, The Democratic Republic of the\",\"243\"],\"DK\":[\"Denmark\",\"45\"],\"DJ\":[\"Djibouti\",\"253\"],\"DM\":[\"Dominica\",\"1767\"],\"DO\":[\"Dominican Republic\",\"1809\"],\"EC\":[\"Ecuador\",\"593\"],\"EG\":[\"Egypt\",\"20\"],\"SV\":[\"El Salvador\",\"503\"],\"GQ\":[\"Equatorial Guinea\",\"240\"],\"ER\":[\"Eritrea\",\"291\"],\"EE\":[\"Estonia\",\"372\"],\"ET\":[\"Ethiopia\",\"251\"],\"FK\":[\"Falkland Islands (Malvinas)\",\"500\"],\"FO\":[\"Faroe Islands\",\"298\"],\"FJ\":[\"Fiji\",\"679\"],\"FI\":[\"Finland\",\"358\"],\"FR\":[\"France\",\"33\"],\"PF\":[\"French Polynesia\",\"689\"],\"GA\":[\"Gabon\",\"241\"],\"GM\":[\"Gambia\",\"220\"],\"GE\":[\"Georgia\",\"995\"],\"DE\":[\"Germany\",\"49\"],\"GH\":[\"Ghana\",\"233\"],\"GI\":[\"Gibraltar\",\"350\"],\"GR\":[\"Greece\",\"30\"],\"GL\":[\"Greenland\",\"299\"],\"GD\":[\"Grenada\",\"1473\"],\"GU\":[\"Guam\",\"1671\"],\"GT\":[\"Guatemala\",\"502\"],\"GN\":[\"Guinea\",\"224\"],\"GW\":[\"Guinea-Bissau\",\"245\"],\"GY\":[\"Guyana\",\"592\"],\"HT\":[\"Haiti\",\"509\"],\"VA\":[\"Holy See (Vatican City State)\",\"39\"],\"HN\":[\"Honduras\",\"504\"],\"HK\":[\"Hong Kong\",\"852\"],\"HU\":[\"Hungary\",\"36\"],\"IS\":[\"Iceland\",\"354\"],\"IN\":[\"India\",\"91\"],\"ID\":[\"Indonesia\",\"62\"],\"IR\":[\"Iran, Islamic Republic of\",\"98\"],\"IQ\":[\"Iraq\",\"964\"],\"IE\":[\"Ireland\",\"353\"],\"IM\":[\"Isle of Man\",\"44\"],\"IL\":[\"Israel\",\"972\"],\"IT\":[\"Italy\",\"39\"],\"CI\":[\"Cote d'Ivoire\",\"225\"],\"JM\":[\"Jamaica\",\"1876\"],\"JP\":[\"Japan\",\"81\"],\"JO\":[\"Jordan\",\"962\"],\"KZ\":[\"Kazakhstan\",\"7\"],\"KE\":[\"Kenya\",\"254\"],\"KI\":[\"Kiribati\",\"686\"],\"KW\":[\"Kuwait\",\"965\"],\"KG\":[\"Kyrgyzstan\",\"996\"],\"LA\":[\"Lao People's Democratic Republic\",\"856\"],\"LV\":[\"Latvia\",\"371\"],\"LB\":[\"Lebanon\",\"961\"],\"LS\":[\"Lesotho\",\"266\"],\"LR\":[\"Liberia\",\"231\"],\"LY\":[\"Libyan Arab Jamahiriya\",\"218\"],\"LI\":[\"Liechtenstein\",\"423\"],\"LT\":[\"Lithuania\",\"370\"],\"LU\":[\"Luxembourg\",\"352\"],\"MO\":[\"Macao\",\"853\"],\"MK\":[\"Macedonia\",\"389\"],\"MG\":[\"Madagascar\",\"261\"],\"MW\":[\"Malawi\",\"265\"],\"MY\":[\"Malaysia\",\"60\"],\"MV\":[\"Maldives\",\"960\"],\"ML\":[\"Mali\",\"223\"],\"MT\":[\"Malta\",\"356\"],\"MH\":[\"Marshall Islands\",\"692\"],\"MR\":[\"Mauritania\",\"222\"],\"MU\":[\"Mauritius\",\"230\"],\"YT\":[\"Mayotte\",\"262\"],\"MX\":[\"Mexico\",\"52\"],\"FM\":[\"Micronesia, Federated States of\",\"691\"],\"MD\":[\"Moldova, Republic of\",\"373\"],\"MC\":[\"Monaco\",\"377\"],\"MN\":[\"Mongolia\",\"976\"],\"ME\":[\"Montenegro\",\"382\"],\"MS\":[\"Montserrat\",\"1664\"],\"MA\":[\"Morocco\",\"212\"],\"MZ\":[\"Mozambique\",\"258\"],\"NA\":[\"Namibia\",\"264\"],\"NR\":[\"Nauru\",\"674\"],\"NP\":[\"Nepal\",\"977\"],\"NL\":[\"Netherlands\",\"31\"],\"AN\":[\"Netherlands Antilles\",\"599\"],\"NC\":[\"New Caledonia\",\"687\"],\"NZ\":[\"New Zealand\",\"64\"],\"NI\":[\"Nicaragua\",\"505\"],\"NE\":[\"Niger\",\"227\"],\"NG\":[\"Nigeria\",\"234\"],\"NU\":[\"Niue\",\"683\"],\"NF\":[\"Norfolk Island\",\"672\"],\"KP\":[\"Korea, Democratic People's Republic of\",\"850\"],\"MP\":[\"Northern Mariana Islands\",\"1670\"],\"NO\":[\"Norway\",\"47\"],\"OM\":[\"Oman\",\"968\"],\"PK\":[\"Pakistan\",\"92\"],\"PW\":[\"Palau\",\"680\"],\"PA\":[\"Panama\",\"507\"],\"PG\":[\"Papua New Guinea\",\"675\"],\"PY\":[\"Paraguay\",\"595\"],\"PE\":[\"Peru\",\"51\"],\"PH\":[\"Philippines\",\"63\"],\"PN\":[\"Pitcairn\",\"870\"],\"PL\":[\"Poland\",\"48\"],\"PT\":[\"Portugal\",\"351\"],\"PR\":[\"Puerto Rico\",\"1\"],\"QA\":[\"Qatar\",\"974\"],\"CG\":[\"Congo\",\"242\"],\"RO\":[\"Romania\",\"40\"],\"RU\":[\"Russian Federation\",\"7\"],\"RW\":[\"Rwanda\",\"250\"],\"BL\":[\"Saint Bartelemey\",\"590\"],\"SH\":[\"Saint Helena\",\"290\"],\"KN\":[\"Saint Kitts and Nevis\",\"1869\"],\"LC\":[\"Saint Lucia\",\"1758\"],\"MF\":[\"Saint Martin\",\"1599\"],\"PM\":[\"Saint Pierre and Miquelon\",\"508\"],\"VC\":[\"Saint Vincent and the Grenadines\",\"1784\"],\"WS\":[\"Samoa\",\"685\"],\"SM\":[\"San Marino\",\"378\"],\"ST\":[\"Sao Tome and Principe\",\"239\"],\"SA\":[\"Saudi Arabia\",\"966\"],\"SN\":[\"Senegal\",\"221\"],\"RS\":[\"Serbia\",\"381\"],\"SC\":[\"Seychelles\",\"248\"],\"SL\":[\"Sierra Leone\",\"232\"],\"SG\":[\"Singapore\",\"65\"],\"SK\":[\"Slovakia\",\"421\"],\"SI\":[\"Slovenia\",\"386\"],\"SB\":[\"Solomon Islands\",\"677\"],\"SO\":[\"Somalia\",\"252\"],\"ZA\":[\"South Africa\",\"27\"],\"KR\":[\"Korea, Republic of\",\"82\"],\"ES\":[\"Spain\",\"34\"],\"LK\":[\"Sri Lanka\",\"94\"],\"SD\":[\"Sudan\",\"249\"],\"SR\":[\"Suriname\",\"597\"],\"SZ\":[\"Swaziland\",\"268\"],\"SE\":[\"Sweden\",\"46\"],\"CH\":[\"Switzerland\",\"41\"],\"SY\":[\"Syrian Arab Republic\",\"963\"],\"TW\":[\"Taiwan\",\"886\"],\"TJ\":[\"Tajikistan\",\"992\"],\"TZ\":[\"Tanzania, United Republic of\",\"255\"],\"TH\":[\"Thailand\",\"66\"],\"TL\":[\"Timor-Leste\",\"670\"],\"TG\":[\"Togo\",\"228\"],\"TK\":[\"Tokelau\",\"690\"],\"TO\":[\"Tonga\",\"676\"],\"TT\":[\"Trinidad and Tobago\",\"1868\"],\"TN\":[\"Tunisia\",\"216\"],\"TR\":[\"Turkey\",\"90\"],\"TM\":[\"Turkmenistan\",\"993\"],\"TC\":[\"Turks and Caicos Islands\",\"1649\"],\"TV\":[\"Tuvalu\",\"688\"],\"UG\":[\"Uganda\",\"256\"],\"UA\":[\"Ukraine\",\"380\"],\"AE\":[\"United Arab Emirates\",\"971\"],\"GB\":[\"United Kingdom\",\"44\"],\"US\":[\"United States\",\"1\"],\"UY\":[\"Uruguay\",\"598\"],\"VI\":[\"Virgin Islands, U.S.\",\"1340\"],\"UZ\":[\"Uzbekistan\",\"998\"],\"VU\":[\"Vanuatu\",\"678\"],\"VE\":[\"Venezuela\",\"58\"],\"VN\":[\"Vietnam\",\"84\"],\"WF\":[\"Wallis and Futuna\",\"681\"],\"YE\":[\"Yemen\",\"967\"],\"ZM\":[\"Zambia\",\"260\"],\"ZW\":[\"Zimbabwe\",\"263\"]}";
        countriesDict_ = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
		
		NSMutableArray *tempArr = [NSMutableArray arrayWithArray:[countriesDict_ allKeys]];
		[tempArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
			NSString *key1 = obj1;
			NSString *key2 = obj2;
			NSArray *country1 = [countriesDict_ objectForKey:key1];
			NSArray *country2 = [countriesDict_ objectForKey:key2];
			NSString *name1 = [country1 objectAtIndex:kCountryName];
			NSString *name2 = [country2 objectAtIndex:kCountryName];
			return [name1 compare:name2];
		}];
		orderedCodes_ = [NSArray arrayWithArray:tempArr];
    }
    
    return self;
}

#pragma mark -
-(NSDictionary *) countriesDict{
    return countriesDict_;
}

-(NSArray *) orderedCodes{
	return orderedCodes_;
}

-(NSString *) currentPhone{
    NSString *currentCountryKey = [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
    NSArray *currentCountry = [countriesDict_ objectForKey:currentCountryKey];
    return [currentCountry objectAtIndex:kCountryPhone];
}

-(NSString *) getCountryCodeFrom:(NSString *) phoneStr{
	
	NSMutableArray *arraySorted = [self getArrayFromCountriesDict];
	
    for (NSArray *country in arraySorted) {
        NSString *phoneCode = [country objectAtIndex:kCountryPhone];
        
        if ([phoneStr startsWith:phoneCode]) {
            return phoneCode;
        }
    }
	
	
    return nil;
}

- (NSMutableArray *) getArrayFromCountriesDict
{
	NSMutableArray *arrayResult = nil;
	arrayResult = [[NSMutableArray alloc] init];
	
	for (NSArray *country in [countriesDict_ allValues]) {
		[arrayResult addObject:country];
	}
	
	[arrayResult sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		NSString *countryPhone1 = [obj1 objectAtIndex:kCountryPhone];
		NSString *countryPhone2 = [obj2 objectAtIndex:kCountryPhone];
		int phoneCodeLen1 = (int)[countryPhone1 length];
		int phoneCodeLen2 = (int)[countryPhone2 length];
		if (phoneCodeLen1 > phoneCodeLen2)
		{
			return NSOrderedAscending;
		}
		else if (phoneCodeLen1 < phoneCodeLen2)
		{
			return NSOrderedDescending;
		}
		else
		{
			return NSOrderedSame;
		}
	}];
	
	return arrayResult;
}

@end
