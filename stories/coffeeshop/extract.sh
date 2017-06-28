#!/usr/bin/env bash
curl -X POST \
  http://localhost:7200/rdf-bridge/1827952717763 \
  -H 'accept: text/plain' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'postman-token: d736d1ab-f543-0067-87cd-cfb7ab6a6bac' \
  --data-urlencode "query=PREFIX geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX nwbw:<http://data.labs.pdok.nl/nwb-wegen/def/nwb-wegen#>

construct {
  ?uri a nwbw:Wegvak ;
    nwbw:junctieEindWegvak ?eindwegvakuri ;
    nwbw:junctieBeginWegvak ?beginwegvakuri ;
	#optionele dingen
    nwbw:begindatum ?begdat ;
    nwbw:wegbeheerderSoort ?wegbeheersoort ;
    nwbw:wegnummer ?wegnummer ;
    nwbw:wegdeelletter ?wegdeelletter ;
    nwbw:hectoletter ?hectoletter ;
    nwbw:relatievePositiecode ?rpecode ;
    nwbw:bstcode ?bstcode ;
    nwbw:administratieveRichting ?admrichting ;
    nwbw:rijrichting ?rijrichting ;
    nwbw:straatnaam ?straatnaam ;
    nwbw:woonplaatsnaamNEN ?plaatsnaamnen ;
    nwbw:gemeenteIdentificatie ?gemeenteID ;
    nwbw:gemeenteNaam ?gemeentenaam ;
    nwbw:huisnummerstructuurLinks ?huisnummerstructuurlinks ;
    nwbw:huisnummerstructuurRechts ?huisnummerstructuurrechts ;
    nwbw:eersteHuisnummerLinks ?eerstehuisnummerlinks ;
    nwbw:eersteHuisnummerRechts ?eerstehuisnummerrechts ;
    nwbw:laatsteHuisnummerLinks ?laatstehuisnummerlinks ;
    nwbw:laatsteHuisnummerRechts ?laatstehuisnummerrechts ;
    nwbw:beginafstand ?beginafstand ;
    nwbw:eindafstand ?eindafstand ;
    nwbw:beginkilometer ?beginkilometer ;
    nwbw:eindkilometer ?eindkilometer ;
    nwbw:positieTvWol ?positietvwol ;
    nwbw:wegbeheercode ?wegbeheercode ;
    nwbw:wegbeheernaam ?wegbeheernaam ;
    nwbw:districtcode ?districtcode ;
    nwbw:districtnaam ?districtnaam ;
    nwbw:dienstcode ?dienstcode ;
    nwbw:dienstnaam ?dienstnaam ;
    nwbw:wegtypeOMS ?wegtype ;
    nwbw:routeletter ?routeletter ;
    nwbw:routenummer ?routenummer ;
    nwbw:routeletter1 ?routeletter1 ;
    nwbw:routenummer1 ?routenummer1 ;
    nwbw:routeletter2 ?routeletter2 ;
    nwbw:routenummer2 ?routenummer2 ;
    nwbw:routeletter3 ?routeletter3 ;
    nwbw:routenummer3 ?routenummer3 ;
    nwbw:routeletter4 ?routeletter4 ;
    nwbw:routenummer4 ?routenummer4 ;
    nwbw:wegnummer ?wegnummer ;
    nwbw:lengte ?lengte_m ;

    # De geometrie
    geo:hasGeometry ?geomuri .
  ?geomuri a geo:Geometry;
    geo:asWKT ?wkt .

} where {
  ?s <urn:col:WVK_ID> ?o ;
  	<urn:col:WVK_BEGDAT> ?begdat ;
  	<urn:col:JTE_ID_BEG> ?beginwegvak ;
  	<urn:col:JTE_ID_END> ?eindwegvak ;
  	<urn:col:WGVK_LEN_M> ?lengte ;
  	<urn:col:wkt_sha1> ?geomhash ;
    <urn:col:WKT> ?wkt .

  optional { ?s <urn:col:WVK_BEGDAT> ?begdat }
  optional { ?s <urn:col:WEGBEHSRT> ?wegbeheersoort }
  optional { ?s <urn:col:WEGNUMMER> ?wegnummer }
  optional { ?s <urn:col:WEGDEELLTR> ?wegdeelletter}
  optional { ?s <urn:col:HECTO_LTTR> ?hectoletter }
  optional { ?s <urn:col:RPE_CODE> ?rpecode }
  optional { ?s <urn:col:BST_CODE> ?bstcode }
  optional { ?s <urn:col:ADMRICHTING> ?admrichting }
  optional { ?s <urn:col:RIJRICHTING> ?rijrichting }
  optional { ?s <urn:col:STT_NAAM> ?straatnaam }
  optional { ?s <urn:col:WPSNAAMNEN> ?plaatsnaamnen }
  optional { ?s <urn:col:GME_ID> ?gemeenteID }
  optional { ?s <urn:col:GME_NAAM> ?gemeentenaam }
  optional { ?s <urn:col:HNRSTRLNKS> ?huisnummerstructuurlinks }
  optional { ?s <urn:col:HNRSTRRHTS> ?huisnummerstructuurrechts }
  optional { ?s <urn:col:E_HNR_LNKS> ?eerstehuisnummerlinks }
  optional { ?s <urn:col:E_HNR_RHTS> ?eerstehuisnummerrechts }
  optional { ?s <urn:col:L_HNR_LNKS> ?laatstehuisnummerlinks }
  optional { ?s <urn:col:L_HNR_RHTS> ?laatstehuisnummerrechts }
  optional { ?s <urn:col:BEGAFSTAND> ?beginafstand }
  optional { ?s <urn:col:ENDAFSTAND> ?eindafstand }
  optional { ?s <urn:col:BEGINKM> ?beginkilometer }
  optional { ?s <urn:col:EINDKM> ?eindkilometer }
  optional { ?s <urn:col:POS_TV_WOL> ?positietvwol }
  optional { ?s <urn:col:WEGBEHCODE> ?wegbeheercode }
  optional { ?s <urn:col:WEGBEHNAAM> ?wegbeheernaam }
  optional { ?s <urn:col:DISTRCODE> ?districtcode }
  optional { ?s <urn:col:DISTRNAAM> ?districtnaam }
  optional { ?s <urn:col:DIENSTCODE> ?dienstcode }
  optional { ?s <urn:col:DIENSTNAAM> ?dienstnaam }
  optional { ?s <urn:col:WGTYPE_OMS> ?wegtype }
  optional { ?s <urn:col:ROUTELTR> ?routeletter }
  optional { ?s <urn:col:ROUTENR> ?routenummer }
  optional { ?s <urn:col:ROUTELTR2> ?routeletter2 }
  optional { ?s <urn:col:ROUTENR2> ?routenummer2 }
  optional { ?s <urn:col:ROUTELTR3> ?routeletter3 }
  optional { ?s <urn:col:ROUTENR3> ?routenummer3 }
  optional { ?s <urn:col:ROUTELTR4> ?routeletter4 }
  optional { ?s <urn:col:ROUTENR4> ?routenummer4 }
  optional { ?s <urn:col:WEGNR_AW> ?wegnummer }

  bind(uri(concat('http://data.labs.pdok.nl/nwb-wegen/id/wegvak/', ?o)) as ?uri) .
  bind(uri(concat('http://data.labs.pdok.nl/nwb-wegen/id/wegvak/', ?beginwegvak)) as ?beginwegvakuri) .
  bind(uri(concat('http://data.labs.pdok.nl/nwb-wegen/id/wegvak/', ?eindwegvak)) as ?eindwegvakuri) .
  bind(uri(concat('http://data.labs.pdok.nl/nwb-wegen/id/geometry/', ?geomhash)) as ?geomuri) .
  bind(strdt(?lengte, xsd:decimal) as ?lengte_m) .
}" | sed 's/ \./ <http:\/\/data.labs.pdok.nl\/nwb-wegen> ./' > nwb-wegen-wegvakken.nq