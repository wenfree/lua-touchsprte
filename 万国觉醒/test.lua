require('tsp')
require('AWZ')
require('ZZBase64')
require("yzm")
require('api')
require('token')


sz = require('sz')
__game = {}
__game.imei = sz.system.serialnumber();
__game.phone_name = getDeviceName()

function update_token(token,idfa)
    local RokToken = llsGameToken();
    local info ={}
    info['token']=token
    info['idfa']=idfa
    info['s']='Rok.Token'
    _api_rok(info)
end


local a = {

{"JEpydrIrxw3grZ5Cq6jozdeWfunfhiEU", '[  {    "app_token" : "JEpydrIrxw3grZ5Cq6jozdeWfunfhiEU",    "user_password" : "",    "app_uid" : "7721735",    "player_id" : "615DE71FD6DF65F37F84CD6DA21C9FA8",    "nickname" : "游客",    "user_type" : 2  }]'},
{"9MiANrPQtWSzq6UrGT4XNQ6nB7gRCMdq", '[  {    "app_token" : "9MiANrPQtWSzq6UrGT4XNQ6nB7gRCMdq",    "user_password" : "",    "app_uid" : "7721841",    "player_id" : "995578F25E1308D034090ECEC7948555",    "nickname" : "游客",    "user_type" : 2  }]'},
{"8rkycCEW70hhucrnEXzAImq6LIBDOr06", '[  {    "app_token" : "8rkycCEW70hhucrnEXzAImq6LIBDOr06",    "user_password" : "",    "app_uid" : "5640151",    "player_id" : "98756C0A7D776BA89CF4ADC2A2681444",    "third_party_token" : "288B23DA4D6B31E5F3F5DFF8A78E855B",    "user_type" : 7  }]'},
{"UHaDsZW2dYhmKekMqkRCgIN71IN20DmK", '[  {    "app_token" : "UHaDsZW2dYhmKekMqkRCgIN71IN20DmK",    "user_password" : "",    "app_uid" : "7723166",    "player_id" : "2798BB9D3620B73AFD99F1BA37237504",    "nickname" : "游客",    "user_type" : 2  }]'},
{"uelmtkrqhrPU9KB5qJLz3XudBCkWmLvi", '[  {    "app_token" : "uelmtkrqhrPU9KB5qJLz3XudBCkWmLvi",    "user_password" : "",    "app_uid" : "7724419",    "player_id" : "EBD33901228F63464F3D9DC36FA2FBDA",    "nickname" : "游客",    "user_type" : 2  }]'},
{"utMtnRndYkLauWZOADlEbnzvRQjA8uHD", '[  {    "app_token" : "utMtnRndYkLauWZOADlEbnzvRQjA8uHD",    "user_password" : "",    "app_uid" : "7724767",    "player_id" : "412BC178F7F3A1F1BD68EEDEA8FD9000",    "nickname" : "游客",    "user_type" : 2  }]'},
{"BEndWR44CVtB9y4csSfNEzt38JEtbT9m", '[  {    "app_token" : "BEndWR44CVtB9y4csSfNEzt38JEtbT9m",    "user_password" : "",    "app_uid" : "7725011",    "player_id" : "85B6D4AD6DCA963766C7DA663B0DE305",    "nickname" : "游客",    "user_type" : 2  }]'},
{"kxlO4mYgynLtWeePLFZzMX15DW9qwKvJ", '[  {    "app_token" : "kxlO4mYgynLtWeePLFZzMX15DW9qwKvJ",    "user_password" : "",    "app_uid" : "7725464",    "player_id" : "414218FE980E46F1A1A454ED48BDDAE1",    "nickname" : "游客",    "user_type" : 2  }]'},
{"wxM4Utt7D6ObLjhNiAAmLXz6F8IF7Roj", '[  {    "app_token" : "wxM4Utt7D6ObLjhNiAAmLXz6F8IF7Roj",    "user_password" : "",    "app_uid" : "7727385",    "player_id" : "B7849D81FB7B2D06EDC7D466EDC7CF05",    "nickname" : "游客",    "user_type" : 2  }]'},
{"jyOpSIt67AyqVrvs2HZJY3NXxzcHHzjh", '[  {    "app_token" : "jyOpSIt67AyqVrvs2HZJY3NXxzcHHzjh",    "user_password" : "",    "app_uid" : "7727539",    "player_id" : "7F64286E93365EF7426B5BE6AFD12F42",    "nickname" : "游客",    "user_type" : 2  }]'},
{"1zK45ojNPdXT1H9Y3650dvhK99G0EZ41", '[  {    "app_token" : "1zK45ojNPdXT1H9Y3650dvhK99G0EZ41",    "user_password" : "",    "app_uid" : "7727650",    "player_id" : "C002EA440364F72E5AFFC1EF7BDD0E28",    "nickname" : "游客",    "user_type" : 2  }]'},
{"EHVhGxTTHvxpmDWWlvps777GTfRHKvLV", '[  {    "app_token" : "EHVhGxTTHvxpmDWWlvps777GTfRHKvLV",    "user_password" : "",    "app_uid" : "7727781",    "player_id" : "BE4FBBA3D83354020FE0F4EBD8F6DAD8",    "nickname" : "游客",    "user_type" : 2  }]'},
{"pnmEPOWPWaZh8Yw9zQXfXyFGvKPR5vYJ", '[  {    "app_token" : "pnmEPOWPWaZh8Yw9zQXfXyFGvKPR5vYJ",    "user_password" : "",    "app_uid" : "7727912",    "player_id" : "A35365921718EB704C4705C57210F1CF",    "nickname" : "游客",    "user_type" : 2  }]'},
{"iAL73NyKHFNOtNLjBjzS3dPOGrbArHvA", '[  {    "app_token" : "iAL73NyKHFNOtNLjBjzS3dPOGrbArHvA",    "user_password" : "",    "app_uid" : "7727998",    "player_id" : "CE5A8648B2544691337E95E639738A0A",    "nickname" : "游客",    "user_type" : 2  }]'},
{"zoeKH9la6JXy8DVas9F1xFKd2ZdUTjKu", '[  {    "app_token" : "zoeKH9la6JXy8DVas9F1xFKd2ZdUTjKu",    "user_password" : "",    "app_uid" : "7728513",    "player_id" : "E1F31B1765D2AF269694FA8F912A3FF2",    "nickname" : "游客",    "user_type" : 2  }]'},
{"0B0FcEZN5ipCwHo1LR0A88LDdY7t1c27", '[  {    "app_token" : "0B0FcEZN5ipCwHo1LR0A88LDdY7t1c27",    "user_password" : "",    "app_uid" : "7728652",    "player_id" : "84F762EB42EEA32CF728FFDABDD99662",    "nickname" : "游客",    "user_type" : 2  }]'},
{"4LFiN5od5f0qfFfqRQjwAwpFlz5gHCBH", '[  {    "app_token" : "4LFiN5od5f0qfFfqRQjwAwpFlz5gHCBH",    "user_password" : "",    "app_uid" : "7728828",    "player_id" : "FA4460B463E019818FF5B02243647A83",    "nickname" : "游客",    "user_type" : 2  }]'},
{"oLdeF9vAV2QGANoaVrckx9pIjXi3chNQ", '[  {    "app_token" : "oLdeF9vAV2QGANoaVrckx9pIjXi3chNQ",    "user_password" : "",    "app_uid" : "7728962",    "player_id" : "4505A06029965B3D23E86A5979709A0E",    "nickname" : "游客",    "user_type" : 2  }]'},
{"rqaXngvzd1ylsNbvfRWxe0YM2TCIHK0P", '[  {    "app_token" : "rqaXngvzd1ylsNbvfRWxe0YM2TCIHK0P",    "user_password" : "",    "app_uid" : "7729114",    "player_id" : "85A9FD56A0E29AE2F6406829C82CF5A3",    "nickname" : "游客",    "user_type" : 2  }]'},
{"A2ypN8jI8ozEZA8fRrqpxpPc6ocvcWRr", '[  {    "app_token" : "A2ypN8jI8ozEZA8fRrqpxpPc6ocvcWRr",    "user_password" : "",    "app_uid" : "7729230",    "player_id" : "E73C4862E04B69E1A0AC40F79C233F29",    "nickname" : "游客",    "user_type" : 2  }]'},
{"6Gt0ZBBL0n1Qd91Yn5y0r5zjLOWHUYTe", '[  {    "app_token" : "6Gt0ZBBL0n1Qd91Yn5y0r5zjLOWHUYTe",    "user_password" : "",    "app_uid" : "7729418",    "player_id" : "EA61C0D49A772B42CDE6139FD789136F",    "nickname" : "游客",    "user_type" : 2  }]'},
{"TGjLf7xAdiEwTLenPjLO6Un3f8Gm5d1w", '[  {    "app_token" : "TGjLf7xAdiEwTLenPjLO6Un3f8Gm5d1w",    "user_password" : "",    "app_uid" : "7729579",    "player_id" : "50958529A008A79E4A489D484DA6741F",    "nickname" : "游客",    "user_type" : 2  }]'},
{"mo5u8FwFGSJ6hxHyWPhPozh73wTTJosF", '[  {    "app_token" : "mo5u8FwFGSJ6hxHyWPhPozh73wTTJosF",    "user_password" : "",    "app_uid" : "7729712",    "player_id" : "91D26720C0CE16E27C86AF5ED8A893EE",    "nickname" : "游客",    "user_type" : 2  }]'},
{"9UlV7T5zLMEdF6JXEphG9dN0s7hKESdS", '[  {    "app_token" : "9UlV7T5zLMEdF6JXEphG9dN0s7hKESdS",    "user_password" : "",    "app_uid" : "7729854",    "player_id" : "ED620326D10A76E1119EFE2B390C465A",    "nickname" : "游客",    "user_type" : 2  }]'},
{"rsU4oavtsyd3dwWtaNA5sLjGPDc4jUz7", '[  {    "app_token" : "rsU4oavtsyd3dwWtaNA5sLjGPDc4jUz7",    "user_password" : "",    "app_uid" : "7729989",    "player_id" : "3462386BD67658A615CBFE89C922783A",    "nickname" : "游客",    "user_type" : 2  }]'},
{"uhSCnrttJ5cWuxVytOfIt4Epl3mgJlNs", '[  {    "app_token" : "uhSCnrttJ5cWuxVytOfIt4Epl3mgJlNs",    "user_password" : "",    "app_uid" : "7730156",    "player_id" : "499965A614B4E2DE48C1A94A701366E7",    "nickname" : "游客",    "user_type" : 2  }]'},
{"62QDh1kJl6S3127ADhHh6hchBWcJLLv1", '[  {    "app_token" : "62QDh1kJl6S3127ADhHh6hchBWcJLLv1",    "user_password" : "",    "app_uid" : "7730287",    "player_id" : "CE753E4A7BD7163F1CC2519691664D51",    "nickname" : "游客",    "user_type" : 2  }]'},
{"ohUdb7EGSl6fZ9zAcbJzVj4Fw3F0Ztju", '[  {    "app_token" : "ohUdb7EGSl6fZ9zAcbJzVj4Fw3F0Ztju",    "user_password" : "",    "app_uid" : "7730691",    "player_id" : "0F6189B72260F674EB5AC5F857F869A9",    "nickname" : "游客",    "user_type" : 2  }]'},
{"oBRFcdHL0cZwuPIzPYy1XY73pr8QX3Dh", '[  {    "app_token" : "oBRFcdHL0cZwuPIzPYy1XY73pr8QX3Dh",    "user_password" : "",    "app_uid" : "7730838",    "player_id" : "23EAB1D990DC587E5E4A8D32D47FB708",    "nickname" : "游客",    "user_type" : 2  }]'},
{"pXhOVdwl3v5lNuAIP94kyv3YAaNEHyRk", '[  {    "app_token" : "pXhOVdwl3v5lNuAIP94kyv3YAaNEHyRk",    "user_password" : "",    "app_uid" : "7731000",    "player_id" : "BCB4C2717F132B5E6E4BF897C9C1AEB0",    "nickname" : "游客",    "user_type" : 2  }]'},
{"VZdVrfbCGwkvWpxzXGWVCNTcC6ETzK6n", '[  {    "app_token" : "VZdVrfbCGwkvWpxzXGWVCNTcC6ETzK6n",    "user_password" : "",    "app_uid" : "7731125",    "player_id" : "EC9FA8778620E63ABC3E071849DA7626",    "nickname" : "游客",    "user_type" : 2  }]'},
{"uEjfC8TpGhjnsQjuhR4JQyDRLJ9iPEjh", '[  {    "app_token" : "uEjfC8TpGhjnsQjuhR4JQyDRLJ9iPEjh",    "user_password" : "",    "app_uid" : "7731269",    "player_id" : "4523217BBE8D6A102231205926B8874B",    "nickname" : "游客",    "user_type" : 2  }]'},
{"ypbPTxkluxjvuJerf1466U58UjOYbVax", '[  {    "app_token" : "ypbPTxkluxjvuJerf1466U58UjOYbVax",    "user_password" : "",    "app_uid" : "7731395",    "player_id" : "3152660AD4647109A5A791BE5B2B260D",    "nickname" : "游客",    "user_type" : 2  }]'},
{"SEdWKRxICwqAqJf64bSmsOCR5eTPtyQ1", '[  {    "app_token" : "SEdWKRxICwqAqJf64bSmsOCR5eTPtyQ1",    "user_password" : "",    "app_uid" : "7731514",    "player_id" : "C83C58EC2809B161773A507F2C06CFBC",    "nickname" : "游客",    "user_type" : 2  }]'},
{"gwzcyg98DqqDnEzOCdoLpAPPalSlajGp", '[  {    "app_token" : "gwzcyg98DqqDnEzOCdoLpAPPalSlajGp",    "user_password" : "",    "app_uid" : "7731667",    "player_id" : "13449C69E220E5B192A9710515B51E28",    "nickname" : "游客",    "user_type" : 2  }]'},
{"HRXnD9r9HZ9rHXgiZYg9f1nMzbChYlys", '[  {    "app_token" : "HRXnD9r9HZ9rHXgiZYg9f1nMzbChYlys",    "user_password" : "",    "app_uid" : "7731763",    "player_id" : "F7F83359C12199FC1070ADCAC18236A6",    "nickname" : "游客",    "user_type" : 2  }]'},
{"WHwqmDIXlIDCM9AW9mtUNoBnxgef1QLp", '[  {    "app_token" : "WHwqmDIXlIDCM9AW9mtUNoBnxgef1QLp",    "user_password" : "",    "app_uid" : "7731847",    "player_id" : "B301C5ECECDA914DFB8842DED2C9B7A6",    "nickname" : "游客",    "user_type" : 2  }]'},
{"9IRbQ57SbUwMeXxbkNjhwjDsJ2CcJQFs", '[  {    "app_token" : "9IRbQ57SbUwMeXxbkNjhwjDsJ2CcJQFs",    "user_password" : "",    "app_uid" : "7731951",    "player_id" : "F9F4C988A47A3A44E67053153F8B82E3",    "nickname" : "游客",    "user_type" : 2  }]'},
{"LHD59lGYnRccs39bkMDlJREcqxw1SKEX", '[  {    "app_token" : "LHD59lGYnRccs39bkMDlJREcqxw1SKEX",    "user_password" : "",    "app_uid" : "7732075",    "player_id" : "6A6B15A352B7C19F3ED268FB5C2E5659",    "nickname" : "游客",    "user_type" : 2  }]'},
{"H9le1UT8Bqp21XJemHHWC3Uy6tgkqnJ3", '[  {    "app_token" : "H9le1UT8Bqp21XJemHHWC3Uy6tgkqnJ3",    "user_password" : "",    "app_uid" : "7732199",    "player_id" : "1507143C63F69F36A56661BF7C0F253A",    "nickname" : "游客",    "user_type" : 2  }]'},
{"lWYvFhuyYbCYef1ddSfS2DNvK6fxxNiL", '[  {    "app_token" : "lWYvFhuyYbCYef1ddSfS2DNvK6fxxNiL",    "user_password" : "",    "app_uid" : "7732331",    "player_id" : "A1619B6B612CCB1E5A8CC8F07D1BE8D3",    "nickname" : "游客",    "user_type" : 2  }]'},
{"vzuFaLUjSA9INJpwmTCA4ceiVswBr0zb", '[  {    "app_token" : "vzuFaLUjSA9INJpwmTCA4ceiVswBr0zb",    "user_password" : "",    "app_uid" : "7732458",    "player_id" : "A42E19F1D4CE7539AADA13CFA11AE225",    "nickname" : "游客",    "user_type" : 2  }]'},
{"ysTytoCxKXijoG08uW8gCN7oEiyqF7j9", '[  {    "app_token" : "ysTytoCxKXijoG08uW8gCN7oEiyqF7j9",    "user_password" : "",    "app_uid" : "7732585",    "player_id" : "3B75C33F917A37CB67CFB9AB518AD345",    "nickname" : "游客",    "user_type" : 2  }]'},
{"XwGORPc8nb7wKMb6qJbBXh7UwKKfkhNV", '[  {    "app_token" : "XwGORPc8nb7wKMb6qJbBXh7UwKKfkhNV",    "user_password" : "",    "app_uid" : "7732730",    "player_id" : "DA924123AE5D14BE63FE87A5EAD35429",    "nickname" : "游客",    "user_type" : 2  }]'},
{"iWf9MRPMWbuOxDaYa2bwnLFdiVEuJQQu", '[  {    "app_token" : "iWf9MRPMWbuOxDaYa2bwnLFdiVEuJQQu",    "user_password" : "",    "app_uid" : "7732887",    "player_id" : "CCCA64F2ACEA813A1BC1D76BD9064D36",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Dmrfhr0xRYftHAQXRiXdasciRz7c5JXf", '[  {    "app_token" : "Dmrfhr0xRYftHAQXRiXdasciRz7c5JXf",    "user_password" : "",    "app_uid" : "7733074",    "player_id" : "2847FFC36ECEDC693F45B048B12552E4",    "nickname" : "游客",    "user_type" : 2  }]'},
{"nN1qDIdZWFUNhQ6rxVe9MqfNpXLVED8I", '[  {    "app_token" : "nN1qDIdZWFUNhQ6rxVe9MqfNpXLVED8I",    "user_password" : "",    "app_uid" : "7733204",    "player_id" : "CABC3197AD076369BB0914FA80E5D6C0",    "nickname" : "游客",    "user_type" : 2  }]'},
{"4UisTtEBlAj4ijMPPBKItrrQd7zuq5OW", '[  {    "app_token" : "4UisTtEBlAj4ijMPPBKItrrQd7zuq5OW",    "user_password" : "",    "app_uid" : "7733389",    "player_id" : "7029C4613FFE31EC5D59226853C050FB",    "nickname" : "游客",    "user_type" : 2  }]'},
{"AgRi725V9TOn6NYFfr5yZmY58GILQByp", '[  {    "app_token" : "AgRi725V9TOn6NYFfr5yZmY58GILQByp",    "user_password" : "",    "app_uid" : "7733615",    "player_id" : "65C9608AAC7C0719E2CD309172AD0360",    "nickname" : "游客",    "user_type" : 2  }]'},
{"QXXodxgNndKbrRn9uHDGoAlUgyYWE7ym", '[  {    "app_token" : "QXXodxgNndKbrRn9uHDGoAlUgyYWE7ym",    "user_password" : "",    "app_uid" : "7734102",    "player_id" : "996E95FF41CDCFAC6CE4AF37F12E94B3",    "nickname" : "游客",    "user_type" : 2  }]'},
{"gEkn4yg8eDZorcYHAqCiIH9lbnFmM44f", '[  {    "app_token" : "gEkn4yg8eDZorcYHAqCiIH9lbnFmM44f",    "user_password" : "",    "app_uid" : "7734269",    "player_id" : "93EF45308FC155F41422D01646C1E446",    "nickname" : "游客",    "user_type" : 2  }]'},
{"v5tEJmb2m0astpECQESbAaho2YFntNT9", '[  {    "app_token" : "v5tEJmb2m0astpECQESbAaho2YFntNT9",    "user_password" : "",    "app_uid" : "7734435",    "player_id" : "AE884CDD7BF0A831A83D26886B116DF6",    "nickname" : "游客",    "user_type" : 2  }]'},
{"1EJt0gXn1BpTg8RBAEipOw8SxGNB9Hmc", '[  {    "app_token" : "1EJt0gXn1BpTg8RBAEipOw8SxGNB9Hmc",    "user_password" : "",    "app_uid" : "7734575",    "player_id" : "1B5DEE3BAF212EF76BE67D979FC4909C",    "nickname" : "游客",    "user_type" : 2  }]'},
{"I3vOkkS4eIVV49CS2RZMe3wAeycA0yLd", '[  {    "app_token" : "I3vOkkS4eIVV49CS2RZMe3wAeycA0yLd",    "user_password" : "",    "app_uid" : "7734902",    "player_id" : "FE5F8A0F32DF3E9FFD4832A98D2E5E1A",    "nickname" : "游客",    "user_type" : 2  }]'},
{"I52zlQwQhpMkXXI8HYJ0MInUvhgVbNKW", '[  {    "app_token" : "I52zlQwQhpMkXXI8HYJ0MInUvhgVbNKW",    "user_password" : "",    "app_uid" : "7735058",    "player_id" : "12B8877467099515580787B2F3105211",    "nickname" : "游客",    "user_type" : 2  }]'},
{"MhvU73q9pFkb1aCFmLmRdldNEkQP1CMS", '[  {    "app_token" : "MhvU73q9pFkb1aCFmLmRdldNEkQP1CMS",    "user_password" : "",    "app_uid" : "7735284",    "player_id" : "54BBCD3F0E5BC2686FE1D37D5C92293F",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Vby4rhkPkZwnnLoiomtM8iKjzHXCIsPF", '[  {    "app_token" : "Vby4rhkPkZwnnLoiomtM8iKjzHXCIsPF",    "user_password" : "",    "app_uid" : "7735475",    "player_id" : "6273CD9F79EAA3E9FA8BA59ED44CBD1B",    "nickname" : "游客",    "user_type" : 2  }]'},
{"78iXMjeYDCMWXrbSXqbDUF65PyTmcP3B", '[  {    "app_token" : "78iXMjeYDCMWXrbSXqbDUF65PyTmcP3B",    "user_password" : "",    "app_uid" : "7738955",    "player_id" : "0F6592CEB0600AADCD21D426BDF22CE1",    "nickname" : "游客",    "user_type" : 2  }]'},
{"2aKro191R65CFdA0dJiJUT181Wh6174W", '[  {    "app_token" : "2aKro191R65CFdA0dJiJUT181Wh6174W",    "user_password" : "",    "app_uid" : "7739155",    "player_id" : "FD3257F29F7FBB9F697A43F629E20D9B",    "nickname" : "游客",    "user_type" : 2  }]'},
{"xnV6j1DrjEPJn8EIWL66MF5KdtHdgyxT", '[  {    "app_token" : "xnV6j1DrjEPJn8EIWL66MF5KdtHdgyxT",    "user_password" : "",    "app_uid" : "7739291",    "player_id" : "62A83C930B1A0C6BAA5451355FE15B13",    "nickname" : "游客",    "user_type" : 2  }]'},
{"yTNIjj8vvkhygJ33vc5qsuh8E3JjfPye", '[  {    "app_token" : "yTNIjj8vvkhygJ33vc5qsuh8E3JjfPye",    "user_password" : "",    "app_uid" : "7739481",    "player_id" : "EDB73A0DEFAD201BA5B95C8C8517E9C8",    "nickname" : "游客",    "user_type" : 2  }]'},
{"o0XN7PVKYm6nszLCTvh6eL7YZCD83USr", '[  {    "app_token" : "o0XN7PVKYm6nszLCTvh6eL7YZCD83USr",    "user_password" : "",    "app_uid" : "7739643",    "player_id" : "1989F70D8F9BA639346B6A731D0DF0AA",    "nickname" : "游客",    "user_type" : 2  }]'},
{"gLxuguCVcaGHpG4iULEJA5xGUbFt3i3c", '[  {    "app_token" : "gLxuguCVcaGHpG4iULEJA5xGUbFt3i3c",    "user_password" : "",    "app_uid" : "7739767",    "player_id" : "7760EF7D7F12ABC9B886ABE54D7ADE67",    "nickname" : "游客",    "user_type" : 2  }]'},
{"YzmJmIJUzF2E0gzxPa9tRXC8TzPGJas2", '[  {    "app_token" : "YzmJmIJUzF2E0gzxPa9tRXC8TzPGJas2",    "user_password" : "",    "app_uid" : "7739940",    "player_id" : "10660D89A42E91BFAF98E21A8DF3A416",    "nickname" : "游客",    "user_type" : 2  }]'},
{"tRNsTm5x4xwYDwowdfSgkAjNds5bkjut", '[  {    "app_token" : "tRNsTm5x4xwYDwowdfSgkAjNds5bkjut",    "user_password" : "",    "app_uid" : "7740122",    "player_id" : "D18338CDFE03703C7BBCA836FE527DB1",    "nickname" : "游客",    "user_type" : 2  }]'},
{"0aeHUC6VTYdL11DlIb8BD9GAFDCnvHvI", '[  {    "app_token" : "0aeHUC6VTYdL11DlIb8BD9GAFDCnvHvI",    "user_password" : "",    "app_uid" : "7743496",    "player_id" : "BCBE7656F29C2985ED66E833E1C7FEF9",    "third_party_token" : "A8CB52371B01725094BFE97A2A5CF792",    "user_type" : 7  }]'},
{"Kn0IhhZ1IPW26znww6P64H0eoRbLkGhA", '[  {    "app_token" : "Kn0IhhZ1IPW26znww6P64H0eoRbLkGhA",    "user_password" : "",    "app_uid" : "7743766",    "player_id" : "9107BCCD5F0151DB08D2E673C6125B22",    "nickname" : "游客",    "user_type" : 2  }]'},
{"q6OOPm4tema8Zl4WYeVRzYdCFqB3Pfn5", '[  {    "app_token" : "q6OOPm4tema8Zl4WYeVRzYdCFqB3Pfn5",    "user_password" : "",    "app_uid" : "7743964",    "player_id" : "BACFF7FFBDB59C5BE8B6CD07551A53BF",    "nickname" : "游客",    "user_type" : 2  }]'},
{"bnp40HiYeHgGGp1edci2Zbr66Agbb7Q3", '[  {    "app_token" : "bnp40HiYeHgGGp1edci2Zbr66Agbb7Q3",    "user_password" : "",    "app_uid" : "7744161",    "player_id" : "D2342A23EFA4F1A19837529357109773",    "nickname" : "游客",    "user_type" : 2  }]'},
{"wQJcSRxWji49RF731jno12xifgZYuDHS", '[  {    "app_token" : "wQJcSRxWji49RF731jno12xifgZYuDHS",    "user_password" : "",    "app_uid" : "7744307",    "player_id" : "937ED0FC247735D4185D123195319F20",    "nickname" : "游客",    "user_type" : 2  }]'},
{"6a0D4U0B8AYj7SbGZ6DitDpOZmk8ezGx", '[  {    "app_token" : "6a0D4U0B8AYj7SbGZ6DitDpOZmk8ezGx",    "user_password" : "",    "app_uid" : "7744437",    "player_id" : "E21BB01A2AE45E7415A5DFB8500474A0",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Oyq9zP988B59fXenjzTL3kV4utpKZVnr", '[  {    "app_token" : "Oyq9zP988B59fXenjzTL3kV4utpKZVnr",    "user_password" : "",    "app_uid" : "7744551",    "player_id" : "1BA606A620281F0C99FCAC4730B47B0F",    "nickname" : "游客",    "user_type" : 2  }]'},
{"GWXFLnSfrEY0f94f3Qrvcr2bsqTrjODB", '[  {    "app_token" : "GWXFLnSfrEY0f94f3Qrvcr2bsqTrjODB",    "user_password" : "",    "app_uid" : "7744999",    "player_id" : "918FC397C990BB60D84C01A5427041D7",    "nickname" : "游客",    "user_type" : 2  }]'},
{"5oaI1ZNB68xvwsUKGJbR7WCGARiARY8j", '[  {    "app_token" : "5oaI1ZNB68xvwsUKGJbR7WCGARiARY8j",    "user_password" : "",    "app_uid" : "7745137",    "player_id" : "02F7E3DD4C5059E3811C9993DEDFB48D",    "nickname" : "游客",    "user_type" : 2  }]'},
{"4gZ9KyRjHGOTpfcbjbIZ08Jb5tgac3GY", '[  {    "app_token" : "4gZ9KyRjHGOTpfcbjbIZ08Jb5tgac3GY",    "user_password" : "",    "app_uid" : "7747905",    "player_id" : "62BF0DC0F739612EA6444E30D4958148",    "nickname" : "游客",    "user_type" : 2  }]'},
{"6TJYZFvBUqTLIRd8A41yJzc39VI2nPW1", '[  {    "app_token" : "6TJYZFvBUqTLIRd8A41yJzc39VI2nPW1",    "user_password" : "",    "app_uid" : "7748212",    "player_id" : "F75054CFFCB48AB093ACE5F083EB67B4",    "nickname" : "游客",    "user_type" : 2  }]'},
{"SYZu0snC4yrQQ3y1UgRP7oJ8Rn7zyake", '[  {    "app_token" : "SYZu0snC4yrQQ3y1UgRP7oJ8Rn7zyake",    "user_password" : "",    "app_uid" : "7748343",    "player_id" : "0C1A0F7DAF94C4087C38F1D6AC6AAD80",    "nickname" : "游客",    "user_type" : 2  }]'},
{"qjwLlmaQEccK038hxSIYMFXREiINcCeE", '[  {    "app_token" : "qjwLlmaQEccK038hxSIYMFXREiINcCeE",    "user_password" : "",    "app_uid" : "7748545",    "player_id" : "E31ABC31513EF5893634CBB41795BB46",    "nickname" : "游客",    "user_type" : 2  }]'},
{"0jm348R70lWJGcnzTYFE8JmfaqcKnwqU", '[  {    "app_token" : "0jm348R70lWJGcnzTYFE8JmfaqcKnwqU",    "user_password" : "",    "app_uid" : "7767134",    "player_id" : "CD0E726E1C7E55FA6DA1A96A30C5EB52",    "nickname" : "游客",    "user_type" : 2  }]'},
{"3H4sqyfxEKs0A8ENO06cUQdxqBVB2o0h", '[  {    "app_token" : "3H4sqyfxEKs0A8ENO06cUQdxqBVB2o0h",    "user_password" : "",    "app_uid" : "7767246",    "player_id" : "27E178EC4A0917C0BA4E0D8DFA537FC1",    "nickname" : "游客",    "user_type" : 2  }]'},
{"1uWqOSWhEMh03Aq9LI8plih8j0pOk2Ca", '[  {    "app_token" : "1uWqOSWhEMh03Aq9LI8plih8j0pOk2Ca",    "user_password" : "",    "app_uid" : "7767661",    "player_id" : "83D91F41223DAB9F85FE859497053E3A",    "third_party_token" : "D1A4C01988203F5603E71EB3FEE10EFB",    "user_type" : 7  }]'},
{"nDN1KACiJI1rt1lDOCtVxkxv3URwzjHO", '[  {    "app_token" : "nDN1KACiJI1rt1lDOCtVxkxv3URwzjHO",    "user_password" : "",    "app_uid" : "7768000",    "player_id" : "847B933EBAEB766D7488C801091950CF",    "nickname" : "游客",    "user_type" : 2  }]'},
{"hDPfSA6rOhUmoI6kWTM6IajLB0ssTWeC", '[  {    "app_token" : "hDPfSA6rOhUmoI6kWTM6IajLB0ssTWeC",    "user_password" : "",    "app_uid" : "7768513",    "player_id" : "BE9168A8F5BF29F77DDD9B1C762DD947",    "nickname" : "游客",    "user_type" : 2  }]'},
{"TyhDXCyjZu32XTMrQoxtXp68U1riXP9G", '[  {    "app_token" : "TyhDXCyjZu32XTMrQoxtXp68U1riXP9G",    "user_password" : "",    "app_uid" : "7768630",    "player_id" : "CC5AFC9131B459E70FEA6237EC36239C",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Axx0cNmr9sucF8yvhaRswsLBbwGmA5gj", '[  {    "app_token" : "Axx0cNmr9sucF8yvhaRswsLBbwGmA5gj",    "user_password" : "",    "app_uid" : "7768683",    "player_id" : "9C009E75FA490B913586082565B1A11D",    "nickname" : "游客",    "user_type" : 2  }]'},
{"3gb6mwpVBFzTkw6ARdzxYlJZKyRwSPXM", '[  {    "app_token" : "3gb6mwpVBFzTkw6ARdzxYlJZKyRwSPXM",    "user_password" : "",    "app_uid" : "7768815",    "player_id" : "9ACCE1DFE7AC8083C581DA18234F4E0D",    "nickname" : "游客",    "user_type" : 2  }]'},
{"sWCHH3QRyPCWpGBTZjvTNwbKuuNyxRCz", '[  {    "app_token" : "sWCHH3QRyPCWpGBTZjvTNwbKuuNyxRCz",    "user_password" : "",    "app_uid" : "7768849",    "player_id" : "6204A56DC7E6BD4A70273A0A610D3DE5",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Jg6k2m43XTk9zAOldfyvfNX45JtKOSa1", '[  {    "app_token" : "Jg6k2m43XTk9zAOldfyvfNX45JtKOSa1",    "user_password" : "",    "app_uid" : "7768962",    "player_id" : "73A2013810996C4EAB90F8C214DA11A7",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Hx3Wvy4l4P1vTB8k44PYMTBXKfCj5RUs", '[  {    "app_token" : "Hx3Wvy4l4P1vTB8k44PYMTBXKfCj5RUs",    "user_password" : "",    "app_uid" : "7769103",    "player_id" : "41EE3D2EEF76FBC075A88B6B970543A4",    "nickname" : "游客",    "user_type" : 2  }]'},
{"1rrJYlBIHZUNeVN6Bzw0w4Eor29XK633", '[  {    "app_token" : "1rrJYlBIHZUNeVN6Bzw0w4Eor29XK633",    "user_password" : "",    "app_uid" : "7781724",    "player_id" : "B7DB9797BBA4E3070B91E06C12BB9AEE",    "nickname" : "游客",    "user_type" : 2  }]'},
{"Z7jWTBtG5skbnunWlxXC01bNi4FGdGpM", '[  {    "app_token" : "Z7jWTBtG5skbnunWlxXC01bNi4FGdGpM",    "user_password" : "",    "app_uid" : "7781920",    "player_id" : "FFE0349919C60D690BBE4EE2D73EFED1",    "nickname" : "游客",    "user_type" : 2  }]'},
{"IOxkdiOeKxzjjPUDalYYxAoZZp8yKrFe", '[  {    "app_token" : "IOxkdiOeKxzjjPUDalYYxAoZZp8yKrFe",    "user_password" : "",    "app_uid" : "7782658",    "player_id" : "3C7C24C35B225178825A2CE35481F2DA",    "nickname" : "游客",    "user_type" : 2  }]'},
{"wvNNcHdfEM6d3P6zpjYIwe7k59JDt8kA", '[  {    "app_token" : "wvNNcHdfEM6d3P6zpjYIwe7k59JDt8kA",    "user_password" : "",    "app_uid" : "7782858",    "player_id" : "E7AF11B6CAB1235ADF077B1CE0B5E26D",    "nickname" : "游客",    "user_type" : 2  }]'},
{"2fOvefFsoAOhH4fEODzwCAShszPto78c", '[  {    "app_token" : "2fOvefFsoAOhH4fEODzwCAShszPto78c",    "user_password" : "",    "app_uid" : "7783078",    "player_id" : "D3454C3A15CF2124D04BC727313254AB",    "nickname" : "游客",    "user_type" : 2  }]'},
{"IoQavHuNlGr2jHAujPsQ1zQWS4xNYdAX", '[  {    "app_token" : "IoQavHuNlGr2jHAujPsQ1zQWS4xNYdAX",    "user_password" : "",    "app_uid" : "7783717",    "player_id" : "3F9DFDFAA3A4C6688D6199923B921155",    "nickname" : "游客",    "user_type" : 2  }]'},
{"f3nnyQbYQ2Gytc2G0K5jg1ujswRydVFp", '[  {    "app_token" : "f3nnyQbYQ2Gytc2G0K5jg1ujswRydVFp",    "user_password" : "",    "app_uid" : "7783890",    "player_id" : "8AFC04F15A65329762D6A19C12FDC879",    "nickname" : "游客",    "user_type" : 2  }]'},
{"nNLBHEmdyX9I755FXBVZl8TMk4yb1Mch", '[  {    "app_token" : "nNLBHEmdyX9I755FXBVZl8TMk4yb1Mch",    "user_password" : "",    "app_uid" : "7784958",    "player_id" : "D80B069435A2C997CB7F4BF52A49D9D3",    "nickname" : "游客",    "user_type" : 2  }]'},
{"eEuDNYhBpXlDGiO00MD1qx9s61hEv1o5", '[  {    "app_token" : "eEuDNYhBpXlDGiO00MD1qx9s61hEv1o5",    "user_password" : "",    "app_uid" : "7785879",    "player_id" : "76A7258105C5EC084EF173CCB314836E",    "nickname" : "游客",    "user_type" : 2  }]'},
{"EbTvxP7mOe4AYcDMoCbZz5LupvagbCbf", '[  {    "app_token" : "EbTvxP7mOe4AYcDMoCbZz5LupvagbCbf",    "user_password" : "",    "app_uid" : "7786052",    "player_id" : "FDFB193ACDA49B135087722BE01E86B9",    "nickname" : "游客",    "user_type" : 2  }]'},
{"766YxsKqYFnEhDGBrbyhSSTKRkVle9E9", '[  {    "app_token" : "766YxsKqYFnEhDGBrbyhSSTKRkVle9E9",    "user_password" : "",    "app_uid" : "7786293",    "player_id" : "3E17678E54C558FA209B8C29CB3456F3",    "nickname" : "游客",    "user_type" : 2  }]'},
}

    
for k,v in ipairs( a )do
    log(v)
    update_token(v[1],v[2])
end
    
    
    
    
    
