<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xml-stylesheet type="text/xsl" href="CDA.xsl"?>
<ClinicalDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" >
	<!-- ** CDA Header ** -->
	<realmCode code="US"/>
	<typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040"/>
	<!-- Identifies document as conformant to US Realm Header (V2) Template -->
	<templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2014-06-09"/>
	<!-- Consultation Note V2  -->
	<templateId root="2.16.840.1.113883.10.20.22.1.4" extension="2014-06-09"/>
	<id extension="TT988" root="2.16.840.1.113883.19.5.99999.1"/>
	<code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="11488-4" displayName="Consultation Note"/>
	<title>Community Health Consult Note</title>
    <effectiveTime value="${time?number_to_date?string["yyyyMMddHHmmss"]}"/>
	<confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25"/>
	<languageCode code="en-US"/>
	<setId extension="sTT988" root="2.16.840.1.113883.19.5.99999.19"/>
	<versionNumber value="1"/>
	<recordTarget>
		<patientRole>
			<id root="2.16.840.1.113883.19.5" extension="${id}" assigningAuthorityName="https://github.com/synthetichealth/synthea"/>
			<!-- HP is "primary home" from codeSystem 2.16.840.1.113883.5.1119 -->
			<addr use="HP">
				<streetAddressLine>${address}</streetAddressLine>
				<city>${city}</city>
				<state>${state}</state>
				<#if zip?has_content>
				<postalCode>${zip}</postalCode>
				<#else>
				<postalCode nullFlavor="NI"/>
				</#if>
				<!-- US is "United States" from ISO 3166-1 Country Codes: 1.0.3166.1 -->
				<country>US</country>
			</addr>
			<!-- HP is "primary home" from HL7 AddressUse 2.16.840.1.113883.5.1119 -->
			<telecom nullFlavor="NI"/>
			<patient>
				<!-- The first name element represents what the patient is known as -->
				<name use="L">
					<given>${name?keep_before_last(" ")}</given>
					<family>${name?keep_after_last(" ")}</family>
				</name>
				<!-- The second name element represents another name associated with the patient -->
				<name use="SRCH">
					<given>${name?keep_before_last(" ")}</given>
					<family qualifier="BR">${name?keep_after_last(" ")}</family>
				</name>
				<administrativeGenderCode code="${gender}" codeSystem="2.16.840.1.113883.5.1" codeSystemName="HL7 AdministrativeGender"/>
				<!-- Date of birth need only be precise to the day -->
				<birthTime value="${birthdate?number_to_date?string["yyyyMMddHHmmss"]}"/>
				<!-- CDC Race and Ethnicity code set contains the five minimum race and ethnicity 
					categories defined by OMB Standards -->
				<raceCode code="${race_lookup[race]}" displayName="${race}" codeSystemName="CDC Race and Ethnicity" codeSystem="2.16.840.1.113883.6.238"/>
				<ethnicGroupCode code="${ethnicity_lookup[race]}" displayName="${ethnicity_display_lookup[race]}" codeSystemName="CDC Race and Ethnicity" codeSystem="2.16.840.1.113883.6.238"/>
				<languageCommunication>
					<!-- "eng" is ISO 639-2 alpha-3 code for "English" -->
					<languageCode code="eng"/>
					<!-- Patient's preferred language -->
					<preferenceInd value="true"/>
				</languageCommunication>
			</patient>
			<providerOrganization>
				<!-- Organizations SHOULD have an NPI; this is a real root; fake extension -->
				<id extension="219BX" root="2.16.840.1.113883.4.6"/>
				<name>The DoctorsTogether Physician Group</name>
				<telecom use="WP" value="tel: +1(555)555-5000"/>
				<addr>
					<streetAddressLine>1007 Health Drive</streetAddressLine>
					<city>Portland</city>
					<state>OR</state>
					<postalCode>99123</postalCode>
					<country>US</country>
				</addr>
			</providerOrganization>
		</patientRole>
	</recordTarget>
	<author>
		<time value="20130731"/>
		<assignedAuthor>
			<id extension="555555555" root="2.16.840.1.113883.4.6"/>
			<code code="207QA0505X" displayName="Adult Medicine" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
			<addr>
				<streetAddressLine>1004 Healthcare Drive </streetAddressLine>
				<city>Portland</city>
				<state>OR</state>
				<postalCode>99123</postalCode>
				<country>US</country>
			</addr>
			<telecom use="WP" value="tel:+1(555)-1004"/>
			<assignedPerson>
				<name>
					<given>Patricia</given>
					<given qualifier="CL">Patty</given>
					<family>Primary</family>
					<suffix qualifier="AC">M.D.</suffix>
				</name>
			</assignedPerson>
		</assignedAuthor>
	</author>
	<dataEnterer>
		<assignedEntity>
			<id extension="333777777" root="2.16.840.1.113883.4.6"/>
			<addr>
				<streetAddressLine>1007 Healthcare Drive</streetAddressLine>
				<city>Portland</city>
				<state>OR</state>
				<postalCode>99123</postalCode>
				<country>US</country>
			</addr>
			<telecom use="WP" value="tel:+1(555)-1050"/>
			<assignedPerson>
				<name>
					<given>Ellen</given>
					<family>Enter</family>
				</name>
			</assignedPerson>
		</assignedEntity>
	</dataEnterer>
	<informant>
		<assignedEntity>
			<id extension="${id}" root="2.16.840.1.113883.19.5" assigningAuthorityName="https://github.com/synthetichealth/synthea"/>
			<addr use="HP">
				<streetAddressLine>${address}</streetAddressLine>
				<city>${city}</city>
				<state>${state}</state>
                <#if zip?has_content>
				<postalCode>${zip}</postalCode>
                <#else>
                <postalCode nullFlavor="NI"/>
                </#if>
				<country>US</country>
			</addr>
			<telecom nullFlavor="NI"/>
			<assignedPerson>
				<name>
					<given>${name?keep_before_last(" ")}</given>
					<family>${name?keep_after_last(" ")}</family>
					<suffix qualifier="AC">D.O.</suffix>
				</name>
			</assignedPerson>
		</assignedEntity>
	</informant>
	<custodian>
		<assignedCustodian>
			<representedCustodianOrganization>
				<id extension="321CX" root="2.16.840.1.113883.4.6"/>
				<name>Good Health HIE</name>
				<telecom use="WP" value="tel:+1(555)-1009"/>
				<addr use="WP">
					<streetAddressLine>1009 Healthcare Drive </streetAddressLine>
					<city>Portland</city>
					<state>OR</state>
					<postalCode>99123</postalCode>
					<country>US</country>
				</addr>
			</representedCustodianOrganization>
		</assignedCustodian>
	</custodian>
	<informationRecipient>
		<intendedRecipient>
			<informationRecipient>
				<name>
					<given>Sara</given>
					<family>Specialize</family>
					<suffix qualifier="AC">M.D.</suffix>
				</name>
			</informationRecipient>
			<receivedOrganization>
				<name>The DoctorsApart Physician Group</name>
			</receivedOrganization>
		</intendedRecipient>
	</informationRecipient>
	<legalAuthenticator>
		<time value="20130801223615-0800"/>
		<signatureCode code="S"/>
		<assignedEntity>
			<id extension="555555555" root="2.16.840.1.113883.4.6"/>
			<code code="207QA0505X" displayName="Adult Medicine" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
			<addr>
				<streetAddressLine>1004 Healthcare Drive </streetAddressLine>
				<city>Portland</city>
				<state>OR</state>
				<postalCode>99123</postalCode>
				<country>US</country>
			</addr>
			<telecom use="WP" value="tel:+1(555)-1004"/>
			<assignedPerson>
				<name>
					<given>Patricia</given>
					<given qualifier="CL">Patty</given>
					<family>Primary</family>
					<suffix qualifier="AC">M.D.</suffix>
				</name>
			</assignedPerson>
		</assignedEntity>
	</legalAuthenticator>
	<authenticator>
		<time value="201308011030-0800"/>
		<signatureCode code="S"/>
		<assignedEntity>
			<id extension="555555555" root="2.16.840.1.113883.4.6"/>
			<code code="207QA0505X" displayName="Adult Medicine" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
			<addr>
				<streetAddressLine>1004 Healthcare Drive </streetAddressLine>
				<city>Portland</city>
				<state>OR</state>
				<postalCode>99123</postalCode>
				<country>US</country>
			</addr>
			<telecom use="WP" value="tel:+1(555)-1004"/>
			<assignedPerson>
				<name>
					<given>Patricia</given>
					<given qualifier="CL">Patty</given>
					<family>Primary</family>
					<suffix qualifier="AC">M.D.</suffix>
				</name>
			</assignedPerson>
		</assignedEntity>
	</authenticator>
	<!-- This participant represents the person to contact for questions about the consult summary -->
	<participant typeCode="CALLBCK">
		<time value="20050329224411-0500"/>
		<associatedEntity classCode="ASSIGNED">
			<id extension="99999999" root="2.16.840.1.113883.4.6"/>
			<code code="200000000X" codeSystem="2.16.840.1.113883.6.101" displayName="Allopathic &amp; Osteopathic Physicians"/>
			<addr>
				<streetAddressLine>1002 Healthcare Drive </streetAddressLine>
				<city>Ann Arbor</city>
				<state>MI</state>
				<postalCode>97857</postalCode>
				<country>US</country>
			</addr>
			<telecom use="WP" value="tel:555-555-1002"/>
			<associatedPerson>
				<name>
					<given>Henry</given>
					<family>Seven</family>
					<suffix>DO</suffix>
				</name>
			</associatedPerson>
		</associatedEntity>
	</participant>
	<!-- Describes prior orders that are fulfilled (in whole or part) by the service events described in the Consultation Note -->
	<inFulfillmentOf typeCode="FLFS">
		<order classCode="ACT" moodCode="RQO">
			<id root="2.16.840.1.113883.6.96" extension="1298989898"/>
			<code code="388975008" displayName="Weight Reduction Consultation" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
		</order>
	</inFulfillmentOf>
	<componentOf>
		<encompassingEncounter>
			<id extension="9937012" root="2.16.840.1.113883.19"/>
			<code codeSystem="2.16.840.1.113883.6.12" codeSystemName="CPT-4" code="99213" displayName="Evaluation and Management"/>
			<effectiveTime>
				<low value="20130731"/>
				<high value="20130731"/>
			</effectiveTime>
			<location>
				<healthCareFacility>
					<id root="2.16.540.1.113883.19.2"/>
				</healthCareFacility>
			</location>
		</encompassingEncounter>
	</componentOf>
	<!-- CDA Body -->
	<component>
		<structuredBody>
			<!-- ALLERGIES AND INTOLERANCES SECTION (ENTRIES REQUIRED) V2 -->
<#if ehr_allergies?has_content>
<#include "allergies.ftl">
<#else>
<#include "allergies_no_current.ftl" parse=false>
</#if>
			<!-- MEDICATIONS SECTION V2 -->
<#if ehr_medications?has_content>
<#include "medications.ftl">
<#else>
<#include "medications_no_current.ftl" parse=false>
</#if>
			<!-- VITAL SIGNS SECTION V2 -->
<#if ehr_observations?has_content>
<#include "vital_signs.ftl">
<#else>
<#include "vital_signs_no_current.ftl" parse=false>
</#if>
		</structuredBody>
	</component>
</ClinicalDocument>