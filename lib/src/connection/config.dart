import 'package:covid19_web/src/domain/dataEvent/dataEvent.dart';

class Config {
  static String appID = 'UIHmMGHe_z1a4ToE6R6wvmo8889565445785-yJn-_ZY';
  //covid-19 api, url https://rapidapi.com/api-sports/api/covid-193/details
  static Map<String, String> api_covid193_headers = {
    'x-rapidapi-host': 'covid-193.p.rapidapi.com',
    'x-rapidapi-key': 'c142ed732fmshecf476dd808ff4dp17d83fjsnd329241390cd'
  };
  static Map<String, String> api_covid19_stats_headers = {
    'x-rapidapi-host': 'covid-19-coronavirus-statistics.p.rapidapi.com',
    'x-rapidapi-key': 'c142ed732fmshecf476dd808ff4dp17d83fjsnd329241390cd'
  };
  static Map<String, String> api_covid_monitor_headers = {
    'x-rapidapi-host': 'coronavirus-monitor.p.rapidapi.com',
    'x-rapidapi-key': 'c142ed732fmshecf476dd808ff4dp17d83fjsnd329241390cd'
  };

  static String globalAssetsHost = '';
  static int CALENDAR_LIST_MAX = 30;
  static int PROJECT_LIST_MAX = 30;

  static int fetchCount = 0;
  static void updateFetchCount(int c) {
    fetchCount += c;
  }

  static String host = 1 == 0 ? '127.0.0.1' : 'covid-19-933a7.firebaseapp.com';

  static List<Country> COUNTRIES = [
    Country.fromMap({
      'url': '',
      'region': 'all',
      'alpha3': 'all',
      'img': '',
      'name': 'All'
    }),
    Country.fromMap({
      'url': '',
      'region': 'europe',
      'alpha3': '',
      'img': '',
      'name': 'Europe'
    }),
    Country.fromMap(
        {'url': '', 'region': 'asia', 'alpha3': '', 'img': '', 'name': 'Asia'}),
    Country.fromMap({
      'url': '',
      'region': 'africa',
      'alpha3': '',
      'img': '',
      'name': 'Africa'
    }),
    Country.fromMap({
      'url': '',
      'region': 'north-america',
      'alpha3': '',
      'img': '',
      'name': 'North-America'
    }),
    Country.fromMap({
      'url': '',
      'region': 'south-america',
      'alpha3': '',
      'img': '',
      'name': 'South-America'
    }),
    Country.fromMap({
      'url': '',
      'region': '',
      'alpha3': '',
      'img': '',
      'name': 'Diamond-Princess'
    }),
    Country.fromMap({
      'url': '/wiki/Afghanistan',
      'region': 'Asia',
      'alpha3': 'AFG',
      'img': '/9/9a/Flag_of_Afghanistan.svg/32px-Flag_of_Afghanistan.svg.png',
      'name': 'Afghanistan'
    }),
    Country.fromMap({
      'url': '/wiki/%C3%85land_Islands',
      'region': 'Europe',
      'alpha3': 'ALA',
      'img': '/5/52/Flag_of_%C3%85land.svg/32px-Flag_of_%C3%85land.svg.png',
      'name': '\u00c5land Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Albania',
      'region': 'Europe',
      'alpha3': 'ALB',
      'img': '/3/36/Flag_of_Albania.svg/32px-Flag_of_Albania.svg.png',
      'name': 'Albania'
    }),
    Country.fromMap({
      'url': '/wiki/Algeria',
      'region': 'Africa',
      'alpha3': 'DZA',
      'img': '/7/77/Flag_of_Algeria.svg/32px-Flag_of_Algeria.svg.png',
      'name': 'Algeria'
    }),
    Country.fromMap({
      'url': '/wiki/American_Samoa',
      'region': 'Oceania',
      'alpha3': 'ASM',
      'img':
          '/8/87/Flag_of_American_Samoa.svg/32px-Flag_of_American_Samoa.svg.png',
      'name': 'American Samoa'
    }),
    Country.fromMap({
      'url': '/wiki/Andorra',
      'region': 'Europe',
      'alpha3': 'AND',
      'img': '/1/19/Flag_of_Andorra.svg/32px-Flag_of_Andorra.svg.png',
      'name': 'Andorra'
    }),
    Country.fromMap({
      'url': '/wiki/Angola',
      'region': 'Africa',
      'alpha3': 'AGO',
      'img': '/9/9d/Flag_of_Angola.svg/32px-Flag_of_Angola.svg.png',
      'name': 'Angola'
    }),
    Country.fromMap({
      'url': '/wiki/Anguilla',
      'region': 'Asia',
      'alpha3': 'AIA',
      'img': '/b/b4/Flag_of_Anguilla.svg/32px-Flag_of_Anguilla.svg.png',
      'name': 'Anguilla'
    }),
    Country.fromMap({
      'url': '/wiki/Antigua_and_Barbuda',
      'region': 'America',
      'alpha3': 'ATG',
      'img':
          '/8/89/Flag_of_Antigua_and_Barbuda.svg/32px-Flag_of_Antigua_and_Barbuda.svg.png',
      'name': 'Antigua and Barbuda'
    }),
    Country.fromMap({
      'url': '/wiki/Argentina',
      'region': 'America',
      'alpha3': 'ARG',
      'img': '/1/1a/Flag_of_Argentina.svg/32px-Flag_of_Argentina.svg.png',
      'name': 'Argentina'
    }),
    Country.fromMap({
      'url': '/wiki/Armenia',
      'region': 'Europe',
      'alpha3': 'ARM',
      'img': '/2/2f/Flag_of_Armenia.svg/32px-Flag_of_Armenia.svg.png',
      'name': 'Armenia'
    }),
    Country.fromMap({
      'url': '/wiki/Aruba',
      'region': 'Asia',
      'alpha3': 'ABW',
      'img': '/f/f6/Flag_of_Aruba.svg/32px-Flag_of_Aruba.svg.png',
      'name': 'Aruba'
    }),
    Country.fromMap({
      'url': '/wiki/Australia',
      'region': 'Oceania',
      'alpha3': 'AUS',
      'img':
          '/8/88/Flag_of_Australia_%28converted%29.svg/32px-Flag_of_Australia_.svg.png',
      'name': 'Australia'
    }),
    Country.fromMap({
      'url': '/wiki/Austria',
      'region': 'Europe',
      'alpha3': 'AUT',
      'img': '/4/41/Flag_of_Austria.svg/32px-Flag_of_Austria.svg.png',
      'name': 'Austria'
    }),
    Country.fromMap({
      'url': '/wiki/Azerbaijan',
      'region': 'Europe',
      'alpha3': 'AZE',
      'img': '/d/dd/Flag_of_Azerbaijan.svg/32px-Flag_of_Azerbaijan.svg.png',
      'name': 'Azerbaijan'
    }),
    Country.fromMap({
      'url': '/wiki/Bahamas',
      'region': 'America',
      'alpha3': 'BHS',
      'img': '/9/93/Flag_of_the_Bahamas.svg/32px-Flag_of_the_Bahamas.svg.png',
      'name': 'Bahamas'
    }),
    Country.fromMap({
      'url': '/wiki/Bahrain',
      'region': 'Asia',
      'alpha3': 'BHR',
      'img': '/2/2c/Flag_of_Bahrain.svg/32px-Flag_of_Bahrain.svg.png',
      'name': 'Bahrain'
    }),
    Country.fromMap({
      'url': '/wiki/Bangladesh',
      'region': 'Asia',
      'alpha3': 'BGD',
      'img': '/f/f9/Flag_of_Bangladesh.svg/32px-Flag_of_Bangladesh.svg.png',
      'name': 'Bangladesh'
    }),
    Country.fromMap({
      'url': '/wiki/Barbados',
      'region': 'America',
      'alpha3': 'BRB',
      'img': '/e/ef/Flag_of_Barbados.svg/32px-Flag_of_Barbados.svg.png',
      'name': 'Barbados'
    }),
    Country.fromMap({
      'url': '/wiki/Belarus',
      'region': 'Europe',
      'alpha3': 'BLR',
      'img': '/8/85/Flag_of_Belarus.svg/32px-Flag_of_Belarus.svg.png',
      'name': 'Belarus'
    }),
    Country.fromMap({
      'url': '/wiki/Belgium',
      'region': 'Europe',
      'alpha3': 'BEL',
      'img': '/6/65/Flag_of_Belgium.svg/32px-Flag_of_Belgium.svg.png',
      'name': 'Belgium'
    }),
    Country.fromMap({
      'url': '/wiki/Belize',
      'region': 'America',
      'alpha3': 'BLZ',
      'img': '/e/e7/Flag_of_Belize.svg/32px-Flag_of_Belize.svg.png',
      'name': 'Belize'
    }),
    Country.fromMap({
      'url': '/wiki/Benin',
      'region': 'Africa',
      'alpha3': 'BEN',
      'img': '/0/0a/Flag_of_Benin.svg/32px-Flag_of_Benin.svg.png',
      'name': 'Benin'
    }),
    Country.fromMap({
      'url': '/wiki/Bermuda',
      'region': 'America',
      'alpha3': 'BMU',
      'img': '/b/bf/Flag_of_Bermuda.svg/32px-Flag_of_Bermuda.svg.png',
      'name': 'Bermuda'
    }),
    Country.fromMap({
      'url': '/wiki/Bhutan',
      'region': 'Asia',
      'alpha3': 'BTN',
      'img': '/9/91/Flag_of_Bhutan.svg/32px-Flag_of_Bhutan.svg.png',
      'name': 'Bhutan'
    }),
    Country.fromMap({
      'url': '/wiki/Bolivia,_Plurinational_State_of',
      'region': 'America',
      'alpha3': 'BOL',
      'img':
          '/d/de/Flag_of_Bolivia_%28state%29.svg/32px-Flag_of_Bolivia_%28state%29.svg.png',
      'name': 'Bolivia'
    }),
    Country.fromMap({
      'url': '/wiki/Bonaire,_Sint_Eustatius_and_Saba',
      'region': 'Asia',
      'alpha3': 'BES',
      'img':
          '/2/20/Flag_of_the_Netherlands.svg/32px-Flag_of_the_Netherlands.svg.png',
      'name': 'Bonaire'
    }),
    Country.fromMap({
      'url': '/wiki/Bosnia_and_Herzegovina',
      'region': 'Europe',
      'alpha3': 'BIH',
      'img':
          '/b/bf/Flag_of_Bosnia_and_Herzegovina.svg/32px-Flag_of_Bosnia_and_Herzegovina.svg.png',
      'name': 'Bosnia and Herzegovina'
    }),
    Country.fromMap({
      'url': '/wiki/Botswana',
      'region': 'Africa',
      'alpha3': 'BWA',
      'img': '/f/fa/Flag_of_Botswana.svg/32px-Flag_of_Botswana.svg.png',
      'name': 'Botswana'
    }),
    Country.fromMap({
      'url': '/wiki/Bouvet_Island',
      'region': 'Asia',
      'alpha3': 'BVT',
      'img': '/d/d9/Flag_of_Norway.svg/32px-Flag_of_Norway.svg.png',
      'name': 'Bouvet Island'
    }),
    Country.fromMap({
      'url': '/wiki/Brazil',
      'region': 'America',
      'alpha3': 'BRA',
      'img': '/0/05/Flag_of_Brazil.svg/32px-Flag_of_Brazil.svg.png',
      'name': 'Brazil'
    }),
    Country.fromMap({
      'url': '/wiki/British_Indian_Ocean_Territory',
      'region': 'Asia',
      'alpha3': 'IOT',
      'img':
          '/6/6e/Flag_of_the_British_Indian_Ocean_Territory.svg/32px-Flag_of_the_British_Indian_Ocean_Territory.svg.png',
      'name': 'British Indian Ocean Territory'
    }),
    Country.fromMap({
      'url': '/wiki/Brunei_Darussalam',
      'region': 'Asia',
      'alpha3': 'BRN',
      'img': '/9/9c/Flag_of_Brunei.svg/32px-Flag_of_Brunei.svg.png',
      'name': 'Brunei'
    }),
    Country.fromMap({
      'url': '/wiki/Bulgaria',
      'region': 'Europe',
      'alpha3': 'BGR',
      'img': '/9/9a/Flag_of_Bulgaria.svg/32px-Flag_of_Bulgaria.svg.png',
      'name': 'Bulgaria'
    }),
    Country.fromMap({
      'url': '/wiki/Burkina_Faso',
      'region': 'Africa',
      'alpha3': 'BFA',
      'img': '/3/31/Flag_of_Burkina_Faso.svg/32px-Flag_of_Burkina_Faso.svg.png',
      'name': 'Burkina Faso'
    }),
    Country.fromMap({
      'url': '/wiki/Burundi',
      'region': 'Africa',
      'alpha3': 'BDI',
      'img': '/5/50/Flag_of_Burundi.svg/32px-Flag_of_Burundi.svg.png',
      'name': 'Burundi'
    }),
    Country.fromMap({
      'url': '/wiki/Cambodia',
      'region': 'Asia',
      'alpha3': 'KHM',
      'img': '/8/83/Flag_of_Cambodia.svg/32px-Flag_of_Cambodia.svg.png',
      'name': 'Cambodia'
    }),
    Country.fromMap({
      'url': '/wiki/Cameroon',
      'region': 'Africa',
      'alpha3': 'CMR',
      'img': '/4/4f/Flag_of_Cameroon.svg/32px-Flag_of_Cameroon.svg.png',
      'name': 'Cameroon'
    }),
    Country.fromMap({
      'url': '/wiki/Canada',
      'region': 'America',
      'alpha3': 'CAN',
      'img': '/c/cf/Flag_of_Canada.svg/32px-Flag_of_Canada.svg.png',
      'name': 'Canada'
    }),
    Country.fromMap({
      'url': '/wiki/Cape_Verde',
      'region': 'Asia',
      'alpha3': 'CPV',
      'img': '/3/38/Flag_of_Cape_Verde.svg/32px-Flag_of_Cape_Verde.svg.png',
      'name': 'Cabo-Verde'
    }),
    Country.fromMap({
      'url': '/wiki/Cayman_Islands',
      'region': 'Asia',
      'alpha3': 'CYM',
      'img':
          '/0/0f/Flag_of_the_Cayman_Islands.svg/32px-Flag_of_the_Cayman_Islands.svg.png',
      'name': 'Cayman Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Central_African_Republic',
      'region': 'Africa',
      'alpha3': 'CAF',
      'img':
          '/6/6f/Flag_of_the_Central_African_Republic.svg/32px-Flag_of_the_Central_African_Republic.svg.png',
      'name': 'CAR'
    }),
    Country.fromMap({
      'url': '/wiki/Chad',
      'region': 'Africa',
      'alpha3': 'TCD',
      'img': '/4/4b/Flag_of_Chad.svg/32px-Flag_of_Chad.svg.png',
      'name': 'Chad'
    }),
    Country.fromMap({
      'url': '/wiki/Channel_Islands',
      'region': 'Europe',
      'alpha3': 'Channel-Islands',
      'img':
          '/f/f5/Flag_of_the_Channel_Islands_1.png/320px-Flag_of_the_Channel_Islands_1.png',
      'name': 'Channel-Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Chile',
      'region': 'America',
      'alpha3': 'CHL',
      'img': '/7/78/Flag_of_Chile.svg/32px-Flag_of_Chile.svg.png',
      'name': 'Chile'
    }),
    Country.fromMap({
      'url': '/wiki/China',
      'region': 'Asia',
      'alpha3': 'CHN',
      'img':
          '/f/fa/Flag_of_the_People%27s_Republic_of_China.svg/32px-Flag_of_the_People%27s_Republic_of_China.svg.png',
      'name': 'China'
    }),
    Country.fromMap({
      'url': '/wiki/Christmas_Island',
      'region': 'Asia',
      'alpha3': 'CXR',
      'img':
          '/6/67/Flag_of_Christmas_Island.svg/32px-Flag_of_Christmas_Island.svg.png',
      'name': 'Christmas Island'
    }),
    Country.fromMap({
      'url': '/wiki/Cocos_(Keeling)_Islands',
      'region': 'Asia',
      'alpha3': 'CCK',
      'img':
          '/7/74/Flag_of_the_Cocos_%28Keeling%29_Islands.svg/32px-Flag_of_the_Cocos_%28Keeling%29_Islands.svg.png',
      'name': 'Cocos Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Colombia',
      'region': 'America',
      'alpha3': 'COL',
      'img': '/2/21/Flag_of_Colombia.svg/32px-Flag_of_Colombia.svg.png',
      'name': 'Colombia'
    }),
    Country.fromMap({
      'url': '/wiki/Comoros',
      'region': 'Asia',
      'alpha3': 'COM',
      'img': '/9/94/Flag_of_the_Comoros.svg/32px-Flag_of_the_Comoros.svg.png',
      'name': 'Comoros'
    }),
    Country.fromMap({
      'url': '/wiki/Republic_of_the_Congo',
      'region': 'Africa',
      'alpha3': 'COG',
      'img':
          '/9/92/Flag_of_the_Republic_of_the_Congo.svg/32px-Flag_of_the_Republic_of_the_Congo.svg.png',
      'name': 'Congo'
    }),
    Country.fromMap({
      'url': '/wiki/Congo,_the_Democratic_Republic_of_the',
      'region': 'Africa',
      'alpha3': 'COD',
      'img':
          '/6/6f/Flag_of_the_Democratic_Republic_of_the_Congo.svg/32px-Flag_of_the_Democratic_Republic_of_the_Congo.svg.png',
      'name': 'DRC'
    }),
    Country.fromMap({
      'url': '/wiki/Cook_Islands',
      'region': 'Oceania',
      'alpha3': 'COK',
      'img':
          '/3/35/Flag_of_the_Cook_Islands.svg/32px-Flag_of_the_Cook_Islands.svg.png',
      'name': 'Cook Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Costa_Rica',
      'region': 'America',
      'alpha3': 'CRI',
      'img':
          '/b/bc/Flag_of_Costa_Rica_%28state%29.svg/32px-Flag_of_Costa_Rica_%28state%29.svg.png',
      'name': 'Costa Rica'
    }),
    Country.fromMap({
      'url': '/wiki/C%C3%B4te_d%27Ivoire',
      'region': 'Africa',
      'alpha3': 'CIV',
      'img':
          '/f/fe/Flag_of_C%C3%B4te_d%27Ivoire.svg/32px-Flag_of_C%C3%B4te_d%27Ivoire.svg.png',
      'name': 'Ivory Coast'
    }),
    Country.fromMap({
      'url': '/wiki/Croatia',
      'region': 'Europe',
      'alpha3': 'HRV',
      'img': '/1/1b/Flag_of_Croatia.svg/32px-Flag_of_Croatia.svg.png',
      'name': 'Croatia'
    }),
    Country.fromMap({
      'url': '/wiki/Cuba',
      'region': 'America',
      'alpha3': 'CUB',
      'img': '/b/bd/Flag_of_Cuba.svg/32px-Flag_of_Cuba.svg.png',
      'name': 'Cuba'
    }),
    Country.fromMap({
      'url': '/wiki/Cura%C3%A7ao',
      'region': 'Asia',
      'alpha3': 'CUW',
      'img': '/b/b1/Flag_of_Cura%C3%A7ao.svg/32px-Flag_of_Cura%C3%A7ao.svg.png',
      'name': 'Cura&ccedil;ao'
    }),
    Country.fromMap({
      'url': '/wiki/Cyprus',
      'region': 'Europe',
      'alpha3': 'CYP',
      'img': '/d/d4/Flag_of_Cyprus.svg/32px-Flag_of_Cyprus.svg.png',
      'name': 'Cyprus'
    }),
    Country.fromMap({
      'url': '/wiki/Czech_Republic',
      'region': 'Europe',
      'alpha3': 'CZE',
      'img':
          '/c/cb/Flag_of_the_Czech_Republic.svg/32px-Flag_of_the_Czech_Republic.svg.png',
      'name': 'Czechia'
    }),
    Country.fromMap({
      'url': '/wiki/Denmark',
      'region': 'Europe',
      'alpha3': 'DNK',
      'img': '/9/9c/Flag_of_Denmark.svg/32px-Flag_of_Denmark.svg.png',
      'name': 'Denmark'
    }),
    Country.fromMap({
      'url': '/wiki/Djibouti',
      'region': 'Africa',
      'alpha3': 'DJI',
      'img': '/3/34/Flag_of_Djibouti.svg/32px-Flag_of_Djibouti.svg.png',
      'name': 'Djibouti'
    }),
    Country.fromMap({
      'url': '/wiki/Dominica',
      'region': 'America',
      'alpha3': 'DMA',
      'img': '/c/c4/Flag_of_Dominica.svg/32px-Flag_of_Dominica.svg.png',
      'name': 'Dominica'
    }),
    Country.fromMap({
      'url': '/wiki/Dominican_Republic',
      'region': 'America',
      'alpha3': 'DOM',
      'img':
          '/9/9f/Flag_of_the_Dominican_Republic.svg/32px-Flag_of_the_Dominican_Republic.svg.png',
      'name': 'Dominican Republic'
    }),
    Country.fromMap({
      'url': '/wiki/Ecuador',
      'region': 'America',
      'alpha3': 'ECU',
      'img': '/e/e8/Flag_of_Ecuador.svg/32px-Flag_of_Ecuador.svg.png',
      'name': 'Ecuador'
    }),
    Country.fromMap({
      'url': '/wiki/Egypt',
      'region': 'Africa',
      'alpha3': 'EGY',
      'img': '/f/fe/Flag_of_Egypt.svg/32px-Flag_of_Egypt.svg.png',
      'name': 'Egypt'
    }),
    Country.fromMap({
      'url': '/wiki/El_Salvador',
      'region': 'America',
      'alpha3': 'SLV',
      'img': '/3/34/Flag_of_El_Salvador.svg/32px-Flag_of_El_Salvador.svg.png',
      'name': 'El Salvador'
    }),
    Country.fromMap({
      'url': '/wiki/Equatorial_Guinea',
      'region': 'Africa',
      'alpha3': 'GNQ',
      'img':
          '/3/31/Flag_of_Equatorial_Guinea.svg/32px-Flag_of_Equatorial_Guinea.svg.png',
      'name': 'Equatorial Guinea'
    }),
    Country.fromMap({
      'url': '/wiki/Eritrea',
      'region': 'Africa',
      'alpha3': 'ERI',
      'img': '/2/29/Flag_of_Eritrea.svg/32px-Flag_of_Eritrea.svg.png',
      'name': 'Eritrea'
    }),
    Country.fromMap({
      'url': '/wiki/Estonia',
      'region': 'Europe',
      'alpha3': 'EST',
      'img': '/8/8f/Flag_of_Estonia.svg/32px-Flag_of_Estonia.svg.png',
      'name': 'Estonia'
    }),
    Country.fromMap({
      'url': '/wiki/Ethiopia',
      'region': 'Africa',
      'alpha3': 'ETH',
      'img': '/7/71/Flag_of_Ethiopia.svg/32px-Flag_of_Ethiopia.svg.png',
      'name': 'Ethiopia'
    }),
    Country.fromMap({
      'url': '/wiki/Falkland_Islands_(Malvinas)',
      'region': 'America',
      'alpha3': 'FLK',
      'img':
          '/8/83/Flag_of_the_Falkland_Islands.svg/32px-Flag_of_the_Falkland_Islands.svg.png',
      'name': 'Falkland Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Faroe_Islands',
      'region': 'Europe',
      'alpha3': 'FRO',
      'img':
          '/3/3c/Flag_of_the_Faroe_Islands.svg/32px-Flag_of_the_Faroe_Islands.svg.png',
      'name': 'Faeroe Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Fiji',
      'region': 'Oceania',
      'alpha3': 'FJI',
      'img': '/b/ba/Flag_of_Fiji.svg/32px-Flag_of_Fiji.svg.png',
      'name': 'Fiji'
    }),
    Country.fromMap({
      'url': '/wiki/Finland',
      'region': 'Europe',
      'alpha3': 'FIN',
      'img': '/b/bc/Flag_of_Finland.svg/32px-Flag_of_Finland.svg.png',
      'name': 'Finland'
    }),
    Country.fromMap({
      'url': '/wiki/France',
      'region': 'Europe',
      'alpha3': 'FRA',
      'img': '/c/c3/Flag_of_France.svg/32px-Flag_of_France.svg.png',
      'name': 'France'
    }),
    Country.fromMap({
      'url': '/wiki/French_Guiana',
      'region': 'America',
      'alpha3': 'GUF',
      'img':
          '/2/29/Flag_of_French_Guiana.svg/32px-Flag_of_French_Guiana.svg.png',
      'name': 'French Guiana'
    }),
    Country.fromMap({
      'url': '/wiki/French_Polynesia',
      'region': 'Oceania',
      'alpha3': 'PYF',
      'img':
          '/d/db/Flag_of_French_Polynesia.svg/32px-Flag_of_French_Polynesia.svg.png',
      'name': 'French Polynesia'
    }),
    Country.fromMap({
      'url': '/wiki/French_Southern_Territories',
      'region': 'Asia',
      'alpha3': 'ATF',
      'img':
          '/a/a7/Flag_of_the_French_Southern_and_Antarctic_Lands.svg/32px-Flag_of_the_French_Southern_and_Antarctic_Lands.svg.png',
      'name': 'French Southern Territories'
    }),
    Country.fromMap({
      'url': '/wiki/Gabon',
      'region': 'Africa',
      'alpha3': 'GAB',
      'img': '/0/04/Flag_of_Gabon.svg/32px-Flag_of_Gabon.svg.png',
      'name': 'Gabon'
    }),
    Country.fromMap({
      'url': '/wiki/Gambia',
      'region': 'Africa',
      'alpha3': 'GMB',
      'img': '/7/77/Flag_of_The_Gambia.svg/32px-Flag_of_The_Gambia.svg.png',
      'name': 'Gambia'
    }),
    Country.fromMap({
      'url': '/wiki/Georgia_(country)',
      'region': 'Europe',
      'alpha3': 'GEO',
      'img': '/0/0f/Flag_of_Georgia.svg/32px-Flag_of_Georgia.svg.png',
      'name': 'Georgia'
    }),
    Country.fromMap({
      'url': '/wiki/Germany',
      'region': 'Europe',
      'alpha3': 'DEU',
      'img': '/b/ba/Flag_of_Germany.svg/32px-Flag_of_Germany.svg.png',
      'name': 'Germany'
    }),
    Country.fromMap({
      'url': '/wiki/Ghana',
      'region': 'Africa',
      'alpha3': 'GHA',
      'img': '/1/19/Flag_of_Ghana.svg/32px-Flag_of_Ghana.svg.png',
      'name': 'Ghana'
    }),
    Country.fromMap({
      'url': '/wiki/Gibraltar',
      'region': 'Europe',
      'alpha3': 'GIB',
      'img': '/0/02/Flag_of_Gibraltar.svg/32px-Flag_of_Gibraltar.svg.png',
      'name': 'Gibraltar'
    }),
    Country.fromMap({
      'url': '/wiki/Greece',
      'region': 'Europe',
      'alpha3': 'GRC',
      'img': '/5/5c/Flag_of_Greece.svg/32px-Flag_of_Greece.svg.png',
      'name': 'Greece'
    }),
    Country.fromMap({
      'url': '/wiki/Greenland',
      'region': 'Europe',
      'alpha3': 'GRL',
      'img': '/0/09/Flag_of_Greenland.svg/32px-Flag_of_Greenland.svg.png',
      'name': 'Greenland'
    }),
    Country.fromMap({
      'url': '/wiki/Grenada',
      'region': 'America',
      'alpha3': 'GRD',
      'img': '/b/bc/Flag_of_Grenada.svg/32px-Flag_of_Grenada.svg.png',
      'name': 'Grenada'
    }),
    Country.fromMap({
      'url': '/wiki/Guadeloupe',
      'region': 'Europe',
      'alpha3': 'GLP',
      'img':
          '/2/29/Flag_of_French_Guiana.svg/32px-Flag_of_French_Guiana.svg.png',
      'name': 'Guadeloupe'
    }),
    Country.fromMap({
      'url': '/wiki/Guam',
      'region': 'Oceania',
      'alpha3': 'GUM',
      'img': '/0/07/Flag_of_Guam.svg/32px-Flag_of_Guam.svg.png',
      'name': 'Guam'
    }),
    Country.fromMap({
      'url': '/wiki/Guatemala',
      'region': 'America',
      'alpha3': 'GTM',
      'img': '/e/ec/Flag_of_Guatemala.svg/32px-Flag_of_Guatemala.svg.png',
      'name': 'Guatemala'
    }),
    Country.fromMap({
      'url': '/wiki/Guernsey',
      'region': 'Asia',
      'alpha3': 'GGY',
      'img': '/f/fa/Flag_of_Guernsey.svg/32px-Flag_of_Guernsey.svg.png',
      'name': 'Guernsey'
    }),
    Country.fromMap({
      'url': '/wiki/Guinea',
      'region': 'Africa',
      'alpha3': 'GIN',
      'img': '/e/ed/Flag_of_Guinea.svg/32px-Flag_of_Guinea.svg.png',
      'name': 'Guinea'
    }),
    Country.fromMap({
      'url': '/wiki/Guinea-Bissau',
      'region': 'Asia',
      'alpha3': 'GNB',
      'img':
          '/0/01/Flag_of_Guinea-Bissau.svg/32px-Flag_of_Guinea-Bissau.svg.png',
      'name': 'Guinea-Bissau'
    }),
    Country.fromMap({
      'url': '/wiki/Guyana',
      'region': 'America',
      'alpha3': 'GUY',
      'img': '/9/99/Flag_of_Guyana.svg/32px-Flag_of_Guyana.svg.png',
      'name': 'Guyana'
    }),
    Country.fromMap({
      'url': '/wiki/Haiti',
      'region': 'America',
      'alpha3': 'HTI',
      'img': '/5/56/Flag_of_Haiti.svg/32px-Flag_of_Haiti.svg.png',
      'name': 'Haiti'
    }),
    Country.fromMap({
      'url': '/wiki/Heard_Island_and_McDonald_Islands',
      'region': 'Asia',
      'alpha3': 'HMD',
      'img': '/f/fa/Flag_of_Antarctica.svg/32px-Flag_of_Antarctica.svg.png',
      'name': 'Heard Island and McDonald Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Vatican_City_State',
      'region': 'Europe',
      'alpha3': 'VAT',
      'img':
          '/0/00/Flag_of_the_Vatican_City.svg/32px-Flag_of_the_Vatican_City.svg.png',
      'name': 'Vatican City'
    }),
    Country.fromMap({
      'url': '/wiki/Honduras',
      'region': 'America',
      'alpha3': 'HND',
      'img': '/8/82/Flag_of_Honduras.svg/32px-Flag_of_Honduras.svg.png',
      'name': 'Honduras'
    }),
    Country.fromMap({
      'url': '/wiki/Hong_Kong',
      'region': 'Asia',
      'alpha3': 'HKG',
      'img': '/5/5b/Flag_of_Hong_Kong.svg/32px-Flag_of_Hong_Kong.svg.png',
      'name': 'Hong Kong'
    }),
    Country.fromMap({
      'url': '/wiki/Hungary',
      'region': 'Europe',
      'alpha3': 'HUN',
      'img': '/c/c1/Flag_of_Hungary.svg/32px-Flag_of_Hungary.svg.png',
      'name': 'Hungary'
    }),
    Country.fromMap({
      'url': '/wiki/Iceland',
      'region': 'Europe',
      'alpha3': 'ISL',
      'img': '/c/ce/Flag_of_Iceland.svg/32px-Flag_of_Iceland.svg.png',
      'name': 'Iceland'
    }),
    Country.fromMap({
      'url': '/wiki/India',
      'region': 'Asia',
      'alpha3': 'IND',
      'img': '/4/41/Flag_of_India.svg/32px-Flag_of_India.svg.png',
      'name': 'India'
    }),
    Country.fromMap({
      'url': '/wiki/Indonesia',
      'region': 'Asia',
      'alpha3': 'IDN',
      'img': '/9/9f/Flag_of_Indonesia.svg/32px-Flag_of_Indonesia.svg.png',
      'name': 'Indonesia'
    }),
    Country.fromMap({
      'url': '/wiki/Iran,_Islamic_Republic_of',
      'region': 'Asia',
      'alpha3': 'IRN',
      'img': '/c/ca/Flag_of_Iran.svg/32px-Flag_of_Iran.svg.png',
      'name': 'Iran'
    }),
    Country.fromMap({
      'url': '/wiki/Iraq',
      'region': 'Asia',
      'alpha3': 'IRQ',
      'img': '/f/f6/Flag_of_Iraq.svg/32px-Flag_of_Iraq.svg.png',
      'name': 'Iraq'
    }),
    Country.fromMap({
      'url': '/wiki/Republic_of_Ireland',
      'region': 'Europe',
      'alpha3': 'IRL',
      'img': '/4/45/Flag_of_Ireland.svg/32px-Flag_of_Ireland.svg.png',
      'name': 'Ireland'
    }),
    Country.fromMap({
      'url': '/wiki/Isle_of_Man',
      'region': 'Asia',
      'alpha3': 'IMN',
      'img':
          '/b/bc/Flag_of_the_Isle_of_Man.svg/32px-Flag_of_the_Isle_of_Man.svg.png',
      'name': 'Isle of Man'
    }),
    Country.fromMap({
      'url': '/wiki/Israel',
      'region': 'Asia',
      'alpha3': 'ISR',
      'img': '/d/d4/Flag_of_Israel.svg/32px-Flag_of_Israel.svg.png',
      'name': 'Israel'
    }),
    Country.fromMap({
      'url': '/wiki/Italy',
      'region': 'Europe',
      'alpha3': 'ITA',
      'img': '/0/03/Flag_of_Italy.svg/32px-Flag_of_Italy.svg.png',
      'name': 'Italy'
    }),
    Country.fromMap({
      'url': '/wiki/Jamaica',
      'region': 'Asia',
      'alpha3': 'JAM',
      'img': '/0/0a/Flag_of_Jamaica.svg/32px-Flag_of_Jamaica.svg.png',
      'name': 'Jamaica'
    }),
    Country.fromMap({
      'url': '/wiki/Japan',
      'region': 'Asia',
      'alpha3': 'JPN',
      'img': '/9/9e/Flag_of_Japan.svg/32px-Flag_of_Japan.svg.png',
      'name': 'Japan'
    }),
    Country.fromMap({
      'url': '/wiki/Jersey',
      'region': 'Asia',
      'alpha3': 'JEY',
      'img': '/1/1c/Flag_of_Jersey.svg/32px-Flag_of_Jersey.svg.png',
      'name': 'Jersey'
    }),
    Country.fromMap({
      'url': '/wiki/Jordan',
      'region': 'Asia',
      'alpha3': 'JOR',
      'img': '/c/c0/Flag_of_Jordan.svg/32px-Flag_of_Jordan.svg.png',
      'name': 'Jordan'
    }),
    Country.fromMap({
      'url': '/wiki/Kazakhstan',
      'region': 'Europe',
      'alpha3': 'KAZ',
      'img': '/d/d3/Flag_of_Kazakhstan.svg/32px-Flag_of_Kazakhstan.svg.png',
      'name': 'Kazakhstan'
    }),
    Country.fromMap({
      'url': '/wiki/Kenya',
      'region': 'Africa',
      'alpha3': 'KEN',
      'img': '/4/49/Flag_of_Kenya.svg/32px-Flag_of_Kenya.svg.png',
      'name': 'Kenya'
    }),
    Country.fromMap({
      'url': '/wiki/Kiribati',
      'region': 'Oceania',
      'alpha3': 'KIR',
      'img': '/d/d3/Flag_of_Kiribati.svg/32px-Flag_of_Kiribati.svg.png',
      'name': 'Kiribati'
    }),
    Country.fromMap({
      'url': '/wiki/Korea,_Democratic_People%27s_Republic_of',
      'region': 'Asia',
      'alpha3': 'PRK',
      'img': '/5/51/Flag_of_North_Korea.svg/32px-Flag_of_North_Korea.svg.png',
      'name': 'N-Korea'
    }),
    Country.fromMap({
      'url': '/wiki/Korea,_Republic_of',
      'region': 'Asia',
      'alpha3': 'KOR',
      'img': '/0/09/Flag_of_South_Korea.svg/32px-Flag_of_South_Korea.svg.png',
      'name': 'S-Korea'
    }),
    Country.fromMap({
      'url': '/wiki/Kuwait',
      'region': 'Asia',
      'alpha3': 'KWT',
      'img': '/a/aa/Flag_of_Kuwait.svg/32px-Flag_of_Kuwait.svg.png',
      'name': 'Kuwait'
    }),
    Country.fromMap({
      'url': '/wiki/Kyrgyzstan',
      'region': 'Asia',
      'alpha3': 'KGZ',
      'img': '/c/c7/Flag_of_Kyrgyzstan.svg/32px-Flag_of_Kyrgyzstan.svg.png',
      'name': 'Kyrgyzstan'
    }),
    Country.fromMap({
      'url': '/wiki/Lao_People%27s_Democratic_Republic',
      'region': 'Asia',
      'alpha3': 'LAO',
      'img': '/5/56/Flag_of_Laos.svg/32px-Flag_of_Laos.svg.png',
      'name': 'Laos'
    }),
    Country.fromMap({
      'url': '/wiki/Latvia',
      'region': 'Europe',
      'alpha3': 'LVA',
      'img': '/8/84/Flag_of_Latvia.svg/32px-Flag_of_Latvia.svg.png',
      'name': 'Latvia'
    }),
    Country.fromMap({
      'url': '/wiki/Lebanon',
      'region': 'Asia',
      'alpha3': 'LBN',
      'img': '/5/59/Flag_of_Lebanon.svg/32px-Flag_of_Lebanon.svg.png',
      'name': 'Lebanon'
    }),
    Country.fromMap({
      'url': '/wiki/Lesotho',
      'region': 'Asia',
      'alpha3': 'LSO',
      'img': '/4/4a/Flag_of_Lesotho.svg/32px-Flag_of_Lesotho.svg.png',
      'name': 'Lesotho'
    }),
    Country.fromMap({
      'url': '/wiki/Liberia',
      'region': 'Africa',
      'alpha3': 'LBR',
      'img': '/b/b8/Flag_of_Liberia.svg/32px-Flag_of_Liberia.svg.png',
      'name': 'Liberia'
    }),
    Country.fromMap({
      'url': '/wiki/Libya',
      'region': 'Africa',
      'alpha3': 'LBY',
      'img': '/0/05/Flag_of_Libya.svg/32px-Flag_of_Libya.svg.png',
      'name': 'Libya'
    }),
    Country.fromMap({
      'url': '/wiki/Liechtenstein',
      'region': 'Europe',
      'alpha3': 'LIE',
      'img':
          '/4/47/Flag_of_Liechtenstein.svg/32px-Flag_of_Liechtenstein.svg.png',
      'name': 'Liechtenstein'
    }),
    Country.fromMap({
      'url': '/wiki/Lithuania',
      'region': 'Europe',
      'alpha3': 'LTU',
      'img': '/1/11/Flag_of_Lithuania.svg/32px-Flag_of_Lithuania.svg.png',
      'name': 'Lithuania'
    }),
    Country.fromMap({
      'url': '/wiki/Luxembourg',
      'region': 'Europe',
      'alpha3': 'LUX',
      'img': '/d/da/Flag_of_Luxembourg.svg/32px-Flag_of_Luxembourg.svg.png',
      'name': 'Luxembourg'
    }),
    Country.fromMap({
      'url': '/wiki/Macao',
      'region': 'Asia',
      'alpha3': 'MAC',
      'img': '/6/63/Flag_of_Macau.svg/32px-Flag_of_Macau.svg.png',
      'name': 'Macao'
    }),
    Country.fromMap({
      'url': '/wiki/Macedonia_(Greece)',
      'region': 'Europe',
      'alpha3': '',
      'img': '',
      'name': 'Greece Macedonia'
    }),
    Country.fromMap({
      'url': '/wiki/Republic_of_Macedonia',
      'region': 'Europe',
      'alpha3': 'MKD',
      'img':
          '/7/79/Flag_of_North_Macedonia.svg/320px-Flag_of_North_Macedonia.svg.png',
      'name': 'North-Macedonia'
    }),
    Country.fromMap({
      'url': '/wiki/Madagascar',
      'region': 'Africa',
      'alpha3': 'MDG',
      'img': '/b/bc/Flag_of_Madagascar.svg/32px-Flag_of_Madagascar.svg.png',
      'name': 'Madagascar'
    }),
    Country.fromMap({
      'url': '/wiki/Malawi',
      'region': 'Asia',
      'alpha3': 'MWI',
      'img': '/d/d1/Flag_of_Malawi.svg/32px-Flag_of_Malawi.svg.png',
      'name': 'Malawi'
    }),
    Country.fromMap({
      'url': '/wiki/Malaysia',
      'region': 'Asia',
      'alpha3': 'MYS',
      'img': '/6/66/Flag_of_Malaysia.svg/32px-Flag_of_Malaysia.svg.png',
      'name': 'Malaysia'
    }),
    Country.fromMap({
      'url': '/wiki/Maldives',
      'region': 'Asia',
      'alpha3': 'MDV',
      'img': '/0/0f/Flag_of_Maldives.svg/32px-Flag_of_Maldives.svg.png',
      'name': 'Maldives'
    }),
    Country.fromMap({
      'url': '/wiki/Mali',
      'region': 'Africa',
      'alpha3': 'MLI',
      'img': '/9/92/Flag_of_Mali.svg/32px-Flag_of_Mali.svg.png',
      'name': 'Mali'
    }),
    Country.fromMap({
      'url': '/wiki/Malta',
      'region': 'Europe',
      'alpha3': 'MLT',
      'img': '/7/73/Flag_of_Malta.svg/32px-Flag_of_Malta.svg.png',
      'name': 'Malta'
    }),
    Country.fromMap({
      'url': '/wiki/Marshall_Islands',
      'region': 'Oceania',
      'alpha3': 'MHL',
      'img':
          '/2/2e/Flag_of_the_Marshall_Islands.svg/32px-Flag_of_the_Marshall_Islands.svg.png',
      'name': 'Marshall Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Martinique',
      'region': 'Asia',
      'alpha3': 'MTQ',
      'img': '/c/c3/Flag_of_France.svg/320px-Flag_of_France.svg.png',
      'name': 'Martinique'
    }),
    Country.fromMap({
      'url': '/wiki/Mauritania',
      'region': 'Africa',
      'alpha3': 'MRT',
      'img': '/4/43/Flag_of_Mauritania.svg/32px-Flag_of_Mauritania.svg.png',
      'name': 'Mauritania'
    }),
    Country.fromMap({
      'url': '/wiki/Mauritius',
      'region': 'Asia',
      'alpha3': 'MUS',
      'img': '/7/77/Flag_of_Mauritius.svg/32px-Flag_of_Mauritius.svg.png',
      'name': 'Mauritius'
    }),
    Country.fromMap({
      'url': '/wiki/Mayotte',
      'region': 'Asia',
      'alpha3': 'MYT',
      'img': '/c/c3/Flag_of_France.svg/32px-Flag_of_France.svg.png',
      'name': 'Mayotte'
    }),
    Country.fromMap({
      'url': '/wiki/Mexico',
      'region': 'America',
      'alpha3': 'MEX',
      'img': '/f/fc/Flag_of_Mexico.svg/32px-Flag_of_Mexico.svg.png',
      'name': 'Mexico'
    }),
    Country.fromMap({
      'url': '/wiki/Micronesia,_Federated_States_of',
      'region': 'Oceania',
      'alpha3': 'FSM',
      'img':
          '/e/e4/Flag_of_the_Federated_States_of_Micronesia.svg/32px-Flag_of_the_Federated_States_of_Micronesia.svg.png',
      'name': 'Micronesia'
    }),
    Country.fromMap({
      'url': '/wiki/Moldova,_Republic_of',
      'region': 'Asia',
      'alpha3': 'MDA',
      'img': '/2/27/Flag_of_Moldova.svg/32px-Flag_of_Moldova.svg.png',
      'name': 'Moldova'
    }),
    Country.fromMap({
      'url': '/wiki/Monaco',
      'region': 'Europe',
      'alpha3': 'MCO',
      'img': '/e/ea/Flag_of_Monaco.svg/32px-Flag_of_Monaco.svg.png',
      'name': 'Monaco'
    }),
    Country.fromMap({
      'url': '/wiki/Mongolia',
      'region': 'Asia',
      'alpha3': 'MNG',
      'img': '/4/4c/Flag_of_Mongolia.svg/32px-Flag_of_Mongolia.svg.png',
      'name': 'Mongolia'
    }),
    Country.fromMap({
      'url': '/wiki/Montenegro',
      'region': 'Europe',
      'alpha3': 'MNE',
      'img': '/6/64/Flag_of_Montenegro.svg/32px-Flag_of_Montenegro.svg.png',
      'name': 'Montenegro'
    }),
    Country.fromMap({
      'url': '/wiki/Montserrat',
      'region': 'Asia',
      'alpha3': 'MSR',
      'img': '/d/d0/Flag_of_Montserrat.svg/32px-Flag_of_Montserrat.svg.png',
      'name': 'Montserrat'
    }),
    Country.fromMap({
      'url': '/wiki/Morocco',
      'region': 'Africa',
      'alpha3': 'MAR',
      'img': '/2/2c/Flag_of_Morocco.svg/32px-Flag_of_Morocco.svg.png',
      'name': 'Morocco'
    }),
    Country.fromMap({
      'url': '/wiki/Mozambique',
      'region': 'Africa',
      'alpha3': 'MOZ',
      'img': '/d/d0/Flag_of_Mozambique.svg/32px-Flag_of_Mozambique.svg.png',
      'name': 'Mozambique'
    }),
    Country.fromMap({
      'url': '/wiki/Myanmar',
      'region': 'Asia',
      'alpha3': 'MMR',
      'img': '/8/8c/Flag_of_Myanmar.svg/32px-Flag_of_Myanmar.svg.png',
      'name': 'Myanmar'
    }),
    Country.fromMap({
      'url': '/wiki/Namibia',
      'region': 'Africa',
      'alpha3': 'NAM',
      'img': '/0/00/Flag_of_Namibia.svg/32px-Flag_of_Namibia.svg.png',
      'name': 'Namibia'
    }),
    Country.fromMap({
      'url': '/wiki/Nauru',
      'region': 'Oceania',
      'alpha3': 'NRU',
      'img': '/3/30/Flag_of_Nauru.svg/32px-Flag_of_Nauru.svg.png',
      'name': 'Nauru'
    }),
    Country.fromMap({
      'url': '/wiki/Nepal',
      'region': 'Asia',
      'alpha3': 'NPL',
      'img': '/9/9b/Flag_of_Nepal.svg/32px-Flag_of_Nepal.svg.png',
      'name': 'Nepal'
    }),
    Country.fromMap({
      'url': '/wiki/Netherlands',
      'region': 'Europe',
      'alpha3': 'NLD',
      'img':
          '/2/20/Flag_of_the_Netherlands.svg/32px-Flag_of_the_Netherlands.svg.png',
      'name': 'Netherlands'
    }),
    Country.fromMap({
      'url': '/wiki/New_Caledonia',
      'region': 'Oceania',
      'alpha3': 'NCL',
      'img':
          '/2/26/Flags_of_New_Caledonia.svg/800px-Flags_of_New_Caledonia.svg.png',
      'name': 'New Caledonia'
    }),
    Country.fromMap({
      'url': '/wiki/New_Zealand',
      'region': 'Oceania',
      'alpha3': 'NZL',
      'img': '/3/3e/Flag_of_New_Zealand.svg/32px-Flag_of_New_Zealand.svg.png',
      'name': 'New Zealand'
    }),
    Country.fromMap({
      'url': '/wiki/Nicaragua',
      'region': 'America',
      'alpha3': 'NIC',
      'img': '/1/19/Flag_of_Nicaragua.svg/32px-Flag_of_Nicaragua.svg.png',
      'name': 'Nicaragua',
    }),
    Country.fromMap({
      'url': '/wiki/Niger',
      'region': 'Africa',
      'alpha3': 'NER',
      'img': '/f/f4/Flag_of_Niger.svg/32px-Flag_of_Niger.svg.png',
      'name': 'Niger'
    }),
    Country.fromMap({
      'url': '/wiki/Nigeria',
      'region': 'Africa',
      'alpha3': 'NGA',
      'img': '/7/79/Flag_of_Nigeria.svg/32px-Flag_of_Nigeria.svg.png',
      'name': 'Nigeria'
    }),
    Country.fromMap({
      'url': '/wiki/Niue',
      'region': 'Oceania',
      'alpha3': 'NIU',
      'img': '/0/01/Flag_of_Niue.svg/32px-Flag_of_Niue.svg.png',
      'name': 'Niue'
    }),
    Country.fromMap({
      'url': '/wiki/Norfolk_Island',
      'region': 'Oceania',
      'alpha3': 'NFK',
      'img':
          '/4/48/Flag_of_Norfolk_Island.svg/32px-Flag_of_Norfolk_Island.svg.png',
      'name': 'Norfolk Island'
    }),
    Country.fromMap({
      'url': '/wiki/Northern_Mariana_Islands',
      'region': 'Oceania',
      'alpha3': 'MNP',
      'img':
          '/e/e0/Flag_of_the_Northern_Mariana_Islands.svg/32px-Flag_of_the_Northern_Mariana_Islands.svg.png',
      'name': 'Northern Mariana Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Norway',
      'region': 'Europe',
      'alpha3': 'NOR',
      'img': '/d/d9/Flag_of_Norway.svg/32px-Flag_of_Norway.svg.png',
      'name': 'Norway'
    }),
    Country.fromMap({
      'url': '/wiki/Oman',
      'region': 'Asia',
      'alpha3': 'OMN',
      'img': '/d/dd/Flag_of_Oman.svg/32px-Flag_of_Oman.svg.png',
      'name': 'Oman'
    }),
    Country.fromMap({
      'url': '/wiki/Pakistan',
      'region': 'Asia',
      'alpha3': 'PAK',
      'img': '/3/32/Flag_of_Pakistan.svg/32px-Flag_of_Pakistan.svg.png',
      'name': 'Pakistan'
    }),
    Country.fromMap({
      'url': '/wiki/Palau',
      'region': 'Oceania',
      'alpha3': 'PLW',
      'img': '/4/48/Flag_of_Palau.svg/32px-Flag_of_Palau.svg.png',
      'name': 'Palau'
    }),
    Country.fromMap({
      'url': '/wiki/State_of_Palestine',
      'region': 'Asia',
      'alpha3': 'PSE',
      'img': '/0/00/Flag_of_Palestine.svg/32px-Flag_of_Palestine.svg.png',
      'name': 'Palestine'
    }),
    Country.fromMap({
      'url': '/wiki/Panama',
      'region': 'America',
      'alpha3': 'PAN',
      'img': '/a/ab/Flag_of_Panama.svg/32px-Flag_of_Panama.svg.png',
      'name': 'Panama'
    }),
    Country.fromMap({
      'url': '/wiki/Papua_New_Guinea',
      'region': 'Oceania',
      'alpha3': 'PNG',
      'img':
          '/e/e3/Flag_of_Papua_New_Guinea.svg/32px-Flag_of_Papua_New_Guinea.svg.png',
      'name': 'Papua New Guinea'
    }),
    Country.fromMap({
      'url': '/wiki/Paraguay',
      'region': 'America',
      'alpha3': 'PRY',
      'img': '/2/27/Flag_of_Paraguay.svg/32px-Flag_of_Paraguay.svg.png',
      'name': 'Paraguay'
    }),
    Country.fromMap({
      'url': '/wiki/Peru',
      'region': 'America',
      'alpha3': 'PER',
      'img': '/c/cf/Flag_of_Peru.svg/32px-Flag_of_Peru.svg.png',
      'name': 'Peru'
    }),
    Country.fromMap({
      'url': '/wiki/Philippines',
      'region': 'Asia',
      'alpha3': 'PHL',
      'img':
          '/9/99/Flag_of_the_Philippines.svg/32px-Flag_of_the_Philippines.svg.png',
      'name': 'Philippines'
    }),
    Country.fromMap({
      'url': '/wiki/Pitcairn',
      'region': 'Asia',
      'alpha3': 'PCN',
      'img':
          '/8/88/Flag_of_the_Pitcairn_Islands.svg/32px-Flag_of_the_Pitcairn_Islands.svg.png',
      'name': 'Pitcairn'
    }),
    Country.fromMap({
      'url': '/wiki/Poland',
      'region': 'Europe',
      'alpha3': 'POL',
      'img': '/1/12/Flag_of_Poland.svg/32px-Flag_of_Poland.svg.png',
      'name': 'Poland'
    }),
    Country.fromMap({
      'url': '/wiki/Portugal',
      'region': 'Europe',
      'alpha3': 'PRT',
      'img': '/5/5c/Flag_of_Portugal.svg/32px-Flag_of_Portugal.svg.png',
      'name': 'Portugal'
    }),
    Country.fromMap({
      'url': '/wiki/Puerto_Rico',
      'region': 'America',
      'alpha3': 'PRI',
      'img': '/2/28/Flag_of_Puerto_Rico.svg/32px-Flag_of_Puerto_Rico.svg.png',
      'name': 'Puerto Rico'
    }),
    Country.fromMap({
      'url': '/wiki/Qatar',
      'region': 'Asia',
      'alpha3': 'QAT',
      'img': '/6/65/Flag_of_Qatar.svg/32px-Flag_of_Qatar.svg.png',
      'name': 'Qatar'
    }),
    Country.fromMap({
      'url': '/wiki/R%C3%A9union',
      'region': 'Asia',
      'alpha3': 'REU',
      'img': '/c/c3/Flag_of_France.svg/32px-Flag_of_France.svg.png',
      'name': 'R&eacute;union'
    }),
    Country.fromMap({
      'url': '/wiki/Romania',
      'region': 'Europe',
      'alpha3': 'ROU',
      'img': '/7/73/Flag_of_Romania.svg/32px-Flag_of_Romania.svg.png',
      'name': 'Romania'
    }),
    Country.fromMap({
      'url': '/wiki/Russian_Federation',
      'region': 'Europe',
      'alpha3': 'RUS',
      'img': '/f/f3/Flag_of_Russia.svg/32px-Flag_of_Russia.svg.png',
      'name': 'Russia'
    }),
    Country.fromMap({
      'url': '/wiki/Rwanda',
      'region': 'Africa',
      'alpha3': 'RWA',
      'img': '/1/17/Flag_of_Rwanda.svg/32px-Flag_of_Rwanda.svg.png',
      'name': 'Rwanda'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Barth%C3%A9lemy',
      'region': 'Asia',
      'alpha3': 'BLM',
      'img': '/c/c3/Flag_of_France.svg/32px-Flag_of_France.svg.png',
      'name': 'St-Barth'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Helena,_Ascension_and_Tristan_da_Cunha',
      'region': 'Asia',
      'alpha3': 'SHN',
      'img':
          '/a/ae/Flag_of_the_United_Kingdom.svg/32px-Flag_of_the_United_Kingdom.svg.png',
      'name': 'Saint Helena'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Kitts_and_Nevis',
      'region': 'America',
      'alpha3': 'KNA',
      'img':
          '/f/fe/Flag_of_Saint_Kitts_and_Nevis.svg/32px-Flag_of_Saint_Kitts_and_Nevis.svg.png',
      'name': 'Saint Kitts and Nevis'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Lucia',
      'region': 'America',
      'alpha3': 'LCA',
      'img': '/9/9f/Flag_of_Saint_Lucia.svg/32px-Flag_of_Saint_Lucia.svg.png',
      'name': 'Saint Lucia'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Martin_(French_part)',
      'region': 'Asia',
      'alpha3': 'MAF',
      'img': '/c/c3/Flag_of_France.svg/32px-Flag_of_France.svg.png',
      'name': 'Saint Martin'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Pierre_and_Miquelon',
      'region': 'Asia',
      'alpha3': 'SPM',
      'img':
          '/7/74/Flag_of_Saint-Pierre_and_Miquelon.svg/32px-Flag_of_Saint-Pierre_and_Miquelon.svg.png',
      'name': 'Saint-Pierre-Miquelon'
    }),
    Country.fromMap({
      'url': '/wiki/Saint_Vincent_and_the_Grenadines',
      'region': 'America',
      'alpha3': 'VCT',
      'img':
          '/6/6d/Flag_of_Saint_Vincent_and_the_Grenadines.svg/32px-Flag_of_Saint_Vincent_and_the_Grenadines.svg.png',
      'name': 'St-Vincent-Grenadines'
    }),
    Country.fromMap({
      'url': '/wiki/Samoa',
      'region': 'Oceania',
      'alpha3': 'WSM',
      'img': '/3/31/Flag_of_Samoa.svg/32px-Flag_of_Samoa.svg.png',
      'name': 'Samoa'
    }),
    Country.fromMap({
      'url': '/wiki/San_Marino',
      'region': 'Asia',
      'alpha3': 'SMR',
      'img': '/b/b1/Flag_of_San_Marino.svg/32px-Flag_of_San_Marino.svg.png',
      'name': 'San Marino'
    }),
    Country.fromMap({
      'url': '/wiki/Sao_Tome_and_Principe',
      'region': 'Asia',
      'alpha3': 'STP',
      'img':
          '/4/4f/Flag_of_Sao_Tome_and_Principe.svg/32px-Flag_of_Sao_Tome_and_Principe.svg.png',
      'name': 'Sao Tome and Principe'
    }),
    Country.fromMap({
      'url': '/wiki/Saudi_Arabia',
      'region': 'Asia',
      'alpha3': 'SAU',
      'img': '/0/0d/Flag_of_Saudi_Arabia.svg/32px-Flag_of_Saudi_Arabia.svg.png',
      'name': 'Saudi Arabia'
    }),
    Country.fromMap({
      'url': '/wiki/Senegal',
      'region': 'Africa',
      'alpha3': 'SEN',
      'img': '/f/fd/Flag_of_Senegal.svg/32px-Flag_of_Senegal.svg.png',
      'name': 'Senegal'
    }),
    Country.fromMap({
      'url': '/wiki/Serbia',
      'region': 'Europe',
      'alpha3': 'SRB',
      'img': '/f/ff/Flag_of_Serbia.svg/32px-Flag_of_Serbia.svg.png',
      'name': 'Serbia'
    }),
    Country.fromMap({
      'url': '/wiki/Seychelles',
      'region': 'Asia',
      'alpha3': 'SYC',
      'img': '/f/fc/Flag_of_Seychelles.svg/32px-Flag_of_Seychelles.svg.png',
      'name': 'Seychelles'
    }),
    Country.fromMap({
      'url': '/wiki/Sierra_Leone',
      'region': 'Africa',
      'alpha3': 'SLE',
      'img': '/1/17/Flag_of_Sierra_Leone.svg/32px-Flag_of_Sierra_Leone.svg.png',
      'name': 'Sierra Leone'
    }),
    Country.fromMap({
      'url': '/wiki/Singapore',
      'region': 'Asia',
      'alpha3': 'SGP',
      'img': '/4/48/Flag_of_Singapore.svg/32px-Flag_of_Singapore.svg.png',
      'name': 'Singapore'
    }),
    Country.fromMap({
      'url': '/wiki/Sint_Maarten_(Dutch_part)',
      'region': 'Asia',
      'alpha3': 'SXM',
      'img': '/d/d3/Flag_of_Sint_Maarten.svg/32px-Flag_of_Sint_Maarten.svg.png',
      'name': 'Sint Maarten'
    }),
    Country.fromMap({
      'url': '/wiki/Slovakia',
      'region': 'Europe',
      'alpha3': 'SVK',
      'img': '/e/e6/Flag_of_Slovakia.svg/32px-Flag_of_Slovakia.svg.png',
      'name': 'Slovakia'
    }),
    Country.fromMap({
      'url': '/wiki/Slovenia',
      'region': 'Europe',
      'alpha3': 'SVN',
      'img': '/f/f0/Flag_of_Slovenia.svg/32px-Flag_of_Slovenia.svg.png',
      'name': 'Slovenia'
    }),
    Country.fromMap({
      'url': '/wiki/Solomon_Islands',
      'region': 'Oceania',
      'alpha3': 'SLB',
      'img':
          '/7/74/Flag_of_the_Solomon_Islands.svg/32px-Flag_of_the_Solomon_Islands.svg.png',
      'name': 'Solomon Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Somalia',
      'region': 'Africa',
      'alpha3': 'SOM',
      'img': '/a/a0/Flag_of_Somalia.svg/32px-Flag_of_Somalia.svg.png',
      'name': 'Somalia'
    }),
    Country.fromMap({
      'url': '/wiki/South_Africa',
      'region': 'Africa',
      'alpha3': 'ZAF',
      'img': '/a/af/Flag_of_South_Africa.svg/32px-Flag_of_South_Africa.svg.png',
      'name': 'South Africa'
    }),
    Country.fromMap({
      'url': '/wiki/South_Georgia_and_the_South_Sandwich_Islands',
      'region': 'America',
      'alpha3': 'SGS',
      'img':
          '/e/ed/Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg/32px-Flag_of_South_Georgia_and_the_South_Sandwich_Islands.svg.png',
      'name': 'South Georgia and the South Sandwich Islands'
    }),
    Country.fromMap({
      'url': '/wiki/South_Sudan',
      'region': 'Africa',
      'alpha3': 'SSD',
      'img': '/7/7a/Flag_of_South_Sudan.svg/32px-Flag_of_South_Sudan.svg.png',
      'name': 'South Sudan'
    }),
    Country.fromMap({
      'url': '/wiki/Spain',
      'region': 'Europe',
      'alpha3': 'ESP',
      'img': '/9/9a/Flag_of_Spain.svg/32px-Flag_of_Spain.svg.png',
      'name': 'Spain'
    }),
    Country.fromMap({
      'url': '/wiki/Sri_Lanka',
      'region': 'Asia',
      'alpha3': 'LKA',
      'img': '/1/11/Flag_of_Sri_Lanka.svg/32px-Flag_of_Sri_Lanka.svg.png',
      'name': 'Sri Lanka'
    }),
    Country.fromMap({
      'url': '/wiki/Sudan',
      'region': 'Africa',
      'alpha3': 'SDN',
      'img': '/0/01/Flag_of_Sudan.svg/32px-Flag_of_Sudan.svg.png',
      'name': 'Sudan'
    }),
    Country.fromMap({
      'url': '/wiki/Suriname',
      'region': 'America',
      'alpha3': 'SUR',
      'img': '/6/60/Flag_of_Suriname.svg/32px-Flag_of_Suriname.svg.png',
      'name': 'Suriname'
    }),
    Country.fromMap({
      'url': '/wiki/Swaziland',
      'region': 'Europe',
      'alpha3': 'SWZ',
      'img': '/1/1e/Flag_of_Swaziland.svg/32px-Flag_of_Swaziland.svg.png',
      'name': 'Swaziland'
    }),
    Country.fromMap({
      'url': '/wiki/Sweden',
      'region': 'Europe',
      'alpha3': 'SWE',
      'img': '/4/4c/Flag_of_Sweden.svg/32px-Flag_of_Sweden.svg.png',
      'name': 'Sweden'
    }),
    Country.fromMap({
      'url': '/wiki/Switzerland',
      'region': 'Europe',
      'alpha3': 'CHE',
      'img':
          '/0/08/Flag_of_Switzerland_%28Pantone%29.svg/32px-Flag_of_Switzerland_%28Pantone%29.svg.png',
      'name': 'Switzerland'
    }),
    Country.fromMap({
      'url': '/wiki/Syrian_Arab_Republic',
      'region': 'Asia',
      'alpha3': 'SYR',
      'img': '/5/53/Flag_of_Syria.svg/32px-Flag_of_Syria.svg.png',
      'name': 'Syria'
    }),
    Country.fromMap({
      'url': '/wiki/Taiwan',
      'region': 'Asia',
      'alpha3': 'TWN',
      'img':
          '/7/72/Flag_of_the_Republic_of_China.svg/32px-Flag_of_the_Republic_of_China.svg.png',
      'name': 'Taiwan'
    }),
    Country.fromMap({
      'url': '/wiki/Tajikistan',
      'region': 'Asia',
      'alpha3': 'TJK',
      'img': '/d/d0/Flag_of_Tajikistan.svg/32px-Flag_of_Tajikistan.svg.png',
      'name': 'Tajikistan'
    }),
    Country.fromMap({
      'url': '/wiki/Tanzania,_United_Republic_of',
      'region': 'Africa',
      'alpha3': 'TZA',
      'img': '/3/38/Flag_of_Tanzania.svg/32px-Flag_of_Tanzania.svg.png',
      'name': 'Tanzania'
    }),
    Country.fromMap({
      'url': '/wiki/Thailand',
      'region': 'Asia',
      'alpha3': 'THA',
      'img': '/a/a9/Flag_of_Thailand.svg/32px-Flag_of_Thailand.svg.png',
      'name': 'Thailand'
    }),
    Country.fromMap({
      'url': '/wiki/Timor-Leste',
      'region': 'Asia',
      'alpha3': 'TLS',
      'img': '/2/26/Flag_of_East_Timor.svg/32px-Flag_of_East_Timor.svg.png',
      'name': 'Timor-Leste'
    }),
    Country.fromMap({
      'url': '/wiki/Togo',
      'region': 'Africa',
      'alpha3': 'TGO',
      'img': '/6/68/Flag_of_Togo.svg/32px-Flag_of_Togo.svg.png',
      'name': 'Togo'
    }),
    Country.fromMap({
      'url': '/wiki/Tokelau',
      'region': 'Asia',
      'alpha3': 'TKL',
      'img': '/8/8e/Flag_of_Tokelau.svg/32px-Flag_of_Tokelau.svg.png',
      'name': 'Tokelau'
    }),
    Country.fromMap({
      'url': '/wiki/Tonga',
      'region': 'Oceania',
      'alpha3': 'TON',
      'img': '/9/9a/Flag_of_Tonga.svg/32px-Flag_of_Tonga.svg.png',
      'name': 'Tonga'
    }),
    Country.fromMap({
      'url': '/wiki/Trinidad_and_Tobago',
      'region': 'America',
      'alpha3': 'TTO',
      'img':
          '/6/64/Flag_of_Trinidad_and_Tobago.svg/32px-Flag_of_Trinidad_and_Tobago.svg.png',
      'name': 'Trinidad and Tobago'
    }),
    Country.fromMap({
      'url': '/wiki/Tunisia',
      'region': 'Africa',
      'alpha3': 'TUN',
      'img': '/c/ce/Flag_of_Tunisia.svg/32px-Flag_of_Tunisia.svg.png',
      'name': 'Tunisia'
    }),
    Country.fromMap({
      'url': '/wiki/Turkey',
      'region': 'Asia',
      'alpha3': 'TUR',
      'img': '/b/b4/Flag_of_Turkey.svg/32px-Flag_of_Turkey.svg.png',
      'name': 'Turkey'
    }),
    Country.fromMap({
      'url': '/wiki/Turkmenistan',
      'region': 'Asia',
      'alpha3': 'TKM',
      'img': '/1/1b/Flag_of_Turkmenistan.svg/32px-Flag_of_Turkmenistan.svg.png',
      'name': 'Turkmenistan'
    }),
    Country.fromMap({
      'url': '/wiki/Turks_and_Caicos_Islands',
      'region': 'Asia',
      'alpha3': 'TCA',
      'img':
          '/a/a0/Flag_of_the_Turks_and_Caicos_Islands.svg/32px-Flag_of_the_Turks_and_Caicos_Islands.svg.png',
      'name': 'Turks-and-Caicos'
    }),
    Country.fromMap({
      'url': '/wiki/Tuvalu',
      'region': 'Oceania',
      'alpha3': 'TUV',
      'img': '/3/38/Flag_of_Tuvalu.svg/32px-Flag_of_Tuvalu.svg.png',
      'name': 'Tuvalu'
    }),
    Country.fromMap({
      'url': '/wiki/Uganda',
      'region': 'Africa',
      'alpha3': 'UGA',
      'img': '/4/4e/Flag_of_Uganda.svg/32px-Flag_of_Uganda.svg.png',
      'name': 'Uganda'
    }),
    Country.fromMap({
      'url': '/wiki/Ukraine',
      'region': 'Asia',
      'alpha3': 'UKR',
      'img': '/4/49/Flag_of_Ukraine.svg/32px-Flag_of_Ukraine.svg.png',
      'name': 'Ukraine'
    }),
    Country.fromMap({
      'url': '/wiki/United_Arab_Emirates',
      'region': 'Asia',
      'alpha3': 'ARE',
      'img':
          '/c/cb/Flag_of_the_United_Arab_Emirates.svg/32px-Flag_of_the_United_Arab_Emirates.svg.png',
      'name': 'UAE'
    }),
    Country.fromMap({
      'url': '/wiki/United_Kingdom',
      'region': 'Europe',
      'alpha3': 'GBR',
      'img':
          '/a/ae/Flag_of_the_United_Kingdom.svg/32px-Flag_of_the_United_Kingdom.svg.png',
      'name': 'UK'
    }),
    Country.fromMap({
      'url': '/wiki/United_States',
      'region': 'America',
      'alpha3': 'USA',
      'img':
          '/a/a4/Flag_of_the_United_States.svg/32px-Flag_of_the_United_States.svg.png',
      'name': 'USA'
    }),
    Country.fromMap({
      'url': '/wiki/United_States_Minor_Outlying_Islands',
      'region': 'Asia',
      'alpha3': 'UMI',
      'img':
          '/a/a4/Flag_of_the_United_States.svg/32px-Flag_of_the_United_States.svg.png',
      'name': 'United States Minor Outlying Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Uruguay',
      'region': 'America',
      'alpha3': 'URY',
      'img': '/f/fe/Flag_of_Uruguay.svg/32px-Flag_of_Uruguay.svg.png',
      'name': 'Uruguay'
    }),
    Country.fromMap({
      'url': '/wiki/Uzbekistan',
      'region': 'Asia',
      'alpha3': 'UZB',
      'img': '/8/84/Flag_of_Uzbekistan.svg/32px-Flag_of_Uzbekistan.svg.png',
      'name': 'Uzbekistan'
    }),
    Country.fromMap({
      'url': '/wiki/Vanuatu',
      'region': 'Oceania',
      'alpha3': 'VUT',
      'img': '/b/bc/Flag_of_Vanuatu.svg/32px-Flag_of_Vanuatu.svg.png',
      'name': 'Vanuatu'
    }),
    Country.fromMap({
      'url': '/wiki/Venezuela,_Bolivarian_Republic_of',
      'region': 'America',
      'alpha3': 'VEN',
      'img': '/0/06/Flag_of_Venezuela.svg/32px-Flag_of_Venezuela.svg.png',
      'name': 'Venezuela'
    }),
    Country.fromMap({
      'url': '/wiki/Viet_Nam',
      'region': 'Asia',
      'alpha3': 'VNM',
      'img': '/2/21/Flag_of_Vietnam.svg/32px-Flag_of_Vietnam.svg.png',
      'name': 'Vietnam'
    }),
    Country.fromMap({
      'url': '/wiki/Virgin_Islands,_British',
      'region': 'Asia',
      'alpha3': 'VGB',
      'img':
          '/4/42/Flag_of_the_British_Virgin_Islands.svg/32px-Flag_of_the_British_Virgin_Islands.svg.png',
      'name': 'British Virgin Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Virgin_Islands,_U.S.',
      'region': 'Asia',
      'alpha3': 'VIR',
      'img':
          '/f/f8/Flag_of_the_United_States_Virgin_Islands.svg/32px-Flag_of_the_United_States_Virgin_Islands.svg.png',
      'name': 'US Virgin Islands'
    }),
    Country.fromMap({
      'url': '/wiki/Wallis_and_Futuna',
      'region': 'Oceania',
      'alpha3': 'WLF',
      'img':
          '/d/d2/Flag_of_Wallis_and_Futuna.svg/32px-Flag_of_Wallis_and_Futuna.svg.png',
      'name': 'Wallis and Futuna'
    }),
    Country.fromMap({
      'url': '/wiki/Yemen',
      'region': 'Asia',
      'alpha3': 'YEM',
      'img': '/8/89/Flag_of_Yemen.svg/32px-Flag_of_Yemen.svg.png',
      'name': 'Yemen'
    }),
    Country.fromMap({
      'url': '/wiki/Zambia',
      'region': 'Africa',
      'alpha3': 'ZMB',
      'img': '/0/06/Flag_of_Zambia.svg/32px-Flag_of_Zambia.svg.png',
      'name': 'Zambia'
    }),
    Country.fromMap({
      'url': '/wiki/Zimbabwe',
      'region': 'Africa',
      'alpha3': 'ZWE',
      'img': '/6/6a/Flag_of_Zimbabwe.svg/32px-Flag_of_Zimbabwe.svg.png',
      'name': 'Zimbabwe'
    })
  ];
}
