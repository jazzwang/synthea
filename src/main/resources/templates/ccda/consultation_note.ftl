<#setting number_format="computer">
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xml-stylesheet type="text/xsl" href="CDA.xsl"?>
<ClinicalDocument xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xmlns:cda="urn:hl7-org:v3" xmlns:sdtc="urn:hl7-org:sdtc" >
	<!-- ** CDA Header ** -->
	<realmCode code="US"/>
	<typeId root="2.16.840.1.113883.1.3" extension="POCD_HD000040"/>
	<templateId root="2.16.840.1.113883.10.20.22.1.1" extension="2014-06-09"/>
	<templateId root="2.16.840.1.113883.10.20.22.1.4" extension="2014-06-09"/>
	<id root="2.16.840.1.113883.19.5.99999.1" extension="${id}"/>
	<code code="11488-4"  displayName="Consultation Note" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
	<title>Community Health Consult Note</title>
    <effectiveTime value="${time?number_to_date?string["yyyyMMddHHmmss"]}"/>
	<confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25"/>
	<languageCode code="en-US"/>
	<setId extension="sTT988" root="2.16.840.1.113883.19.5.99999.19"/>
	<versionNumber value="1"/>
	<recordTarget>
		<patientRole>
			<id root="2.16.840.1.113883.19.5" extension="${id}" assigningAuthorityName="https://github.com/synthetichealth/synthea"/>
			<addr use="HP">
				<streetAddressLine>${address}</streetAddressLine>
				<city>${city}</city>
				<state>${state}</state>
				<#if zip?has_content>
				<postalCode>${zip}</postalCode>
				<#else>
				<postalCode nullFlavor="NI"/>
				</#if>
			</addr>
			<telecom nullFlavor="NI"/>
			<patient>
				<name>
					<given>${name?keep_before_last(" ")}</given>
					<family>${name?keep_after_last(" ")}</family>
				</name>
				<administrativeGenderCode code="${gender}" codeSystem="2.16.840.1.113883.5.1" codeSystemName="HL7 AdministrativeGender"/>
				<birthTime value="${birthdate?number_to_date?string["yyyyMMddHHmmss"]}"/>
				<raceCode code="${race_lookup[race]}" displayName="${race}" codeSystemName="CDC Race and Ethnicity" codeSystem="2.16.840.1.113883.6.238"/>
				<ethnicGroupCode code="${ethnicity_lookup[race]}" displayName="${ethnicity_display_lookup[race]}" codeSystemName="CDC Race and Ethnicity" codeSystem="2.16.840.1.113883.6.238"/>
				<languageCommunication>
					<languageCode code="en-US"/>
				</languageCommunication>
			</patient>
		</patientRole>
	</recordTarget>
	<author>
		<time value="${time?number_to_date?string["yyyyMMddHHmmss"]}"/>
		<assignedAuthor>
			<id extension="555555555" root="2.16.840.1.113883.4.6"/>
			<code code="207QA0505X" displayName="Adult Medicine" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
			<telecom nullFlavor="NA" />
			<addr>
				<streetAddressLine>${preferredProviderwellness.address?replace("&", "&amp;")}</streetAddressLine>
				<city>${preferredProviderwellness.city}</city>
				<state>${preferredProviderwellness.state}</state>
				<postalCode>${preferredProviderwellness.zip}</postalCode>
			</addr>
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
	<custodian>
		<assignedCustodian>
			<representedCustodianOrganization>
				<id nullFlavor="NA"/>
				<name>${preferredProviderwellness.name?replace("&", "&amp;")}</name>
				<telecom nullFlavor="NA"/>
				<addr use="WP">
					<streetAddressLine>${preferredProviderwellness.address?replace("&", "&amp;")}</streetAddressLine>
					<city>${preferredProviderwellness.city}</city>
					<state>${preferredProviderwellness.state}</state>
					<postalCode>${preferredProviderwellness.zip}</postalCode>
				</addr>
			</representedCustodianOrganization>
		</assignedCustodian>
	</custodian>
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