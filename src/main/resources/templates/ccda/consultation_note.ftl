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
	<!-- 
*******************************************************
     CDA Body
*******************************************************
	-->
	<component>
		<structuredBody>
			<!-- *********************** -->
			<!--
********************************************************

ALLERGIES AND INTOLERANCES SECTION (ENTRIES REQUIRED) V2

********************************************************
-->
<#if ehr_allergies?has_content>
<#include "allergies.ftl">
<#else>
<#include "allergies_no_current.ftl" parse=false>
</#if>
			<!-- 
********************************************************
ASSESSMENT
********************************************************
			-->
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.8"/>
					<code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="51848-0" displayName="ASSESSMENT"/>
					<title>ASSESSMENT</title>
					<text>
						<list listType="ordered">
							<item>Uncontrolled brittle Type II diabetic.</item>
							<item>Obesity.</item>
						</list>
					</text>
				</section>
			</component>
			<!--
********************************************************
HISTORY OF PRESENT ILLNESS
********************************************************
-->
			<component>
				<section>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.4"/>
					<code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="10164-2" displayName="HISTORY OF PRESENT ILLNESS"/>
					<title>HISTORY OF PRESENT ILLNESS</title>
					<text>
						<paragraph> This is a 38-year-old white woman with years of uncontrolled diabetes who developed a pressure
              ulcer on her left knee that is slow to heal. Diet review from primary care provider shows a tendency for a
              high carbohydrate diet and little to no exercise. She was recently admitted to the hospital for diabetic
              management, wound care, and asthma management. Over the last 3 months her weight has increased by
              20%.</paragraph>
					</text>
				</section>
			</component>
			<!--
********************************************************
FUNCTIONAL STATUS
********************************************************
-->
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.14" extension="2014-06-09"/>
					<!-- Functional Status Section template V2-->
					<code code="47420-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Functional Status"/>
					<title>FUNCTIONAL STATUS</title>
					<text>
						<table border="1" width="100%">
							<thead>
								<tr>
									<th>Functional Category</th>
									<th>Effective Dates</th>
									<th>Results of Evaluation</th>
								</tr>
							</thead>
							<tbody>
								<tr ID="FUNC1">
									<td>Functional Assessment</td>
									<td>July 31, 2013</td>
									<td>Independent Walking</td>
								</tr>
								<tr>
									<td>ADL/IADL: Bathing</td>
									<td>July 31,2013</td>
									<td>Independent</td>
								</tr>
							</tbody>
						</table>
					</text>
					<entry>
						<organizer classCode="CLUSTER" moodCode="EVN">
							<!-- Functional Status Organizer V2-->
							<templateId root="2.16.840.1.113883.10.20.22.4.66" extension="2014-06-09"/>
							<id root="a7bc1062-8649-42a0-833d-eed65bd017c9"/>
							<code code="d5" displayName="Self-Care" codeSystem="2.16.840.1.113883.6.254" codeSystemName="ICF"/>
							<statusCode code="completed"/>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="201307061145-0800"/>
								<assignedAuthor>
									<id extension="555555555" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- Functional Status Observation V2-->
									<templateId root="2.16.840.1.113883.10.20.22.4.67" extension="2014-06-09"/>
									<id root="b63a8636-cfff-4461-b018-40ba58ba8b32"/>
									<code code="54522-8" displayName="Functional status" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<text>
										<reference value="#FUNC1"/>
									</text>
									<statusCode code="completed"/>
									<effectiveTime value="20130731"/>
									<value xsi:type="CD" code="165245003" displayName=" Independent walking" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201307061145-0800"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<entryRelationship typeCode="COMP">
										<supply classCode="SPLY" moodCode="EVN">
											<templateId root="2.16.840.1.113883.10.20.22.4.50" extension="2014-06-09"/>
											<!-- Non-medicinal supply activity template ******* -->
											<id root="2413773c-2372-4299-bbe6-5b0f60664446"/>
											<statusCode code="completed"/>
											<effectiveTime xsi:type="IVL_TS">
												<high value="20130731"/>
											</effectiveTime>
											<quantity value="2"/>
											<participant typeCode="PRD">
												<participantRole classCode="MANU">
													<templateId root="2.16.840.1.113883.10.20.22.4.37"/>
													<!-- Product instance template -->
													<id root="742aee30-21c5-11e1-bfc2-0800200c9a66"/>
													<playingDevice>
														<code code="87405001" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="cane, device (physical object)"/>
													</playingDevice>
													<scopingEntity>
														<id root="eb936010-7b17-11db-9fe1-0800200c9b65"/>
													</scopingEntity>
												</participantRole>
											</participant>
										</supply>
									</entryRelationship>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- Self Care Activities (NEW)-->
									<templateId root="2.16.840.1.113883.10.20.22.4.128"/>
									<id root="c6b5a04b-2bf4-49d1-8336-636a3813df0a"/>
									<code code="46008-9 " displayName="Bathing" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="200130311"/>
									<value xsi:type="CD" code="371153006" displayName="Independent" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201307061148-0800"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</component>
						</organizer>
					</entry>
				</section>
			</component>
			<!--  
********************************************************
MEDICATIONS SECTION V2
********************************************************
-->
<#if ehr_medications?has_content>
<#include "medications.ftl">
<#else>
<#include "medications_no_current.ftl" parse=false>
</#if>
			<!--	
********************************************************
NUTRITION SECTION 
********************************************************
			-->
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.57"/>
					<code code="61144-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Diet and Nutrition"/>
					<title>NUTRITION SECTION</title>
					<text>
						<paragraph>Nutritional Status: well nourished</paragraph>
						<paragraph>Diet: Low sodium diet, excessive carbohydrate </paragraph>
					</text>
					<entry>
						<observation classCode="OBS" moodCode="EVN">
							<!--  Nutritional Status Observation -->
							<templateId root="2.16.840.1.113883.10.20.22.4.124"/>
							<id root="c12ecaaf-53f8-4593-8f79-359aeaa3948b"/>
							<code code="75305-3" displayName="Nutrition status " codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC">
								<originalText>Nutritional Status</originalText>
							</code>
							<statusCode code="completed"/>
							<effectiveTime value="20130512"/>
							<value xsi:type="CD" code="248324001" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED-CT" displayName="well nourished"/>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Nutrition Assessment** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.138"/>
									<id root="ab1791b0-5c71-11db-b0de-0800200c9a66"/>
									<code code="75303-8" displayName="Nutrition assessment" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="20130512"/>
									<value xsi:type="CD" code="386619000" displayName="low sodium diet (finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"> </value>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="20130730"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Nutrition Assessment ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.138"/>
									<id root="ab1791b0-5c71-11db-b0de-0800200c9a66"/>
									<code code="75303-8" displayName="Nutrition assessment" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="20130512"/>
									<value xsi:type="CD" code="430186007" displayName="excessive dietary carbohydrate intake(finding)" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"> </value>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="20130730"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
						</observation>
					</entry>
				</section>
			</component>
			<!--
************************************
			PHYSICAL EXAM V2 
			
************************************ -->
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.2.10" extension="2014-06-09"/>
					<code codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" code="29545-1" displayName="Physical Findings"/>
					<title>Physical Examination</title>
					<text> Key Findings: 1. Obesity. 2. Slow healing Open wound on left knee. 3. Early signs of peripheral
            neuropathy. </text>
				</section>
			</component>
			<!--
********************************************************
Plan of Treatment Section (V2)
********************************************************
-->
			<component>
				<section>
					<templateId root="2.16.840.1.113883.10.20.22.2.10" extension="2014-06-09"/>
					<!--  **** Plan of Treatment section V2 template  **** -->
					<code code="18776-5" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Treatment plan"/>
					<title>TREATMENT PLAN</title>
					<text>
						<content styleCode="Bold"> Hand-off Communication:</content>
						<content>Nurse Florence, RN to Nancy Nightingale, RN</content>
						<br/>
						<br/>
						<table border="1" width="100%">
							<thead>
								<tr>
									<th>Planned Care</th>
									<th>Start Date</th>
									<th>Patient Provider Rating</th>
									<th>Provider Provider Rating</th>
									<th>Provider</th>
									<th>Patient Support/Caregiver</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Encounter for Check-up</td>
									<td>October 15, 2013</td>
									<td>1st, Normal Priority</td>
									<td>3rd, Normal Priority</td>
									<td>Dr. James Case</td>
									<td/>
								</tr>
								<tr>
									<td>Care Goal: Weight loss from baseline weight 10%</td>
									<td>October 15, 2013</td>
									<td>1st, Normal Priority</td>
									<td>3rd, Normal Priority</td>
									<td/>
									<td/>
								</tr>
								<tr>
									<td>Nutrition Recommendation: Education</td>
									<td>July 31, 2013</td>
									<td/>
									<td/>
									<td/>
									<td/>
								</tr>
							</tbody>
						</table>
					</text>
					<entry>
						<act classCode="ACT" moodCode="EVN">
							<templateId root="2.16.840.1.113883.10.20.22.4.141"/>
							<code code="432138007" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="handoff communication (procedure)"/>
							<statusCode code="completed"/>
							<effectiveTime value="20130712"/>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="20130731"/>
								<assignedAuthor>
									<id root="d839038b-7171-4165-a760-467925b43857"/>
								</assignedAuthor>
							</author>
							<participant typeCode="IRCP">
								<participantRole>
									<id root="73add9b3-307d-44ad-bd3e-93f3bd0a3910"/>
									<code code="163W00000X" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)" displayName="Registered Nurse"/>
									<addr>
										<streetAddressLine>1006 Health Drive</streetAddressLine>
										<city>Ann Arbor</city>
										<state>MI</state>
										<postalCode>97867</postalCode>
										<country>US</country>
									</addr>
									<telecom value="tel:+1(555)555-1014" use="WP"/>
									<playingEntity>
										<name>
											<family>Nancy</family>
											<given>Nightingale</given>
											<suffix>RN</suffix>
										</name>
									</playingEntity>
								</participantRole>
							</participant>
						</act>
					</entry>
					<entry>
						<encounter moodCode="INT" classCode="ENC">
							<templateId root="2.16.840.1.113883.10.20.22.4.40" extension="2014-06-09"/>
							<!-- Planned Encounter V2 template -->
							<id root="9a6d1bac-17d3-4195-89a4-1121bc809b4d"/>
							<code code="185349003" displayName="encounter for check-up (procedure)" codeSystemName="SNOMED CT" codeSystem="2.16.840.1.113883.6.96"> </code>
							<statusCode code="active"/>
							<effectiveTime value="20131015"/>
							<performer>
								<assignedEntity>
									<id root="2a620155-9d11-439e-92a3-5d9815ff4de8"/>
									<code code="158965000" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="Medical Practitioner"/>
									<addr>
										<streetAddressLine>1006 Health Drive</streetAddressLine>
										<city>Ann Arbor</city>
										<state>MI</state>
										<postalCode>97867</postalCode>
										<country>US</country>
									</addr>
									<telecom value="tel:+1(995)555-1006" use="WP"/>
									<assignedPerson>
										<name>
											<prefix>Dr.</prefix>
											<family>James</family>
											<given>Case</given>
										</name>
									</assignedPerson>
								</assignedEntity>
							</performer>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="20130730"/>
								<assignedAuthor>
									<id extension="555555555" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="REFR">
								<observation classCode="OBS" moodCode="EVN">
									<!--  Priority Preference-->
									<templateId root="2.16.840.1.113883.10.20.22.4.143"/>
									<id root="9a6d1bac-17d3-4195-89a4-1121bc809b4d"/>
									<code code="225773000" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="preference"/>
									<effectiveTime value="20130615"/>
									<value xsi:type="CD" code="394848005" codeSystem="2.16.840.1.113883.6.96" displayName="Normal priority"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="20130730"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
						</encounter>
					</entry>
					<entry>
						<observation classCode="OBS" moodCode="GOL">
							<!-- Goal Observation -->
							<templateId root="2.16.840.1.113883.10.20.22.4.121"/>
							<id root="9b56c25d-9104-45ee-9fa4-e0f3afaa01c1"/>
							<code code="45735-8" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Weight loss"/>
							<text>Care Goal: Weight loss from baseline weight 10%</text>
							<statusCode code="active"/>
							<effectiveTime value="20131015"/>
							<value xsi:type="IVL_PQ">
								<low value="10" unit="%"/>
							</value>
							<!--
                If the author is set to the recordTarget (patient), this is a patient goal.  
                If the author is set to a provider, this is a provider goal. 
                If both patient and provider are set as authors, this is a negotiated goal.
               -->
							<!-- Provider Author -->
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="20130730"/>
								<assignedAuthor>
									<id root="d839038b-7171-4165-a760-467925b43857"/>
									<code code="163W00000X" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)" displayName="Registered nurse"/>
									<assignedPerson>
										<name>
											<given>Nurse</given>
											<family>Florence</family>
											<suffix>RN</suffix>
										</name>
									</assignedPerson>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="REFR">
								<observation classCode="OBS" moodCode="EVN">
									<!--  Priority Preference-->
									<templateId root="2.16.840.1.113883.10.20.22.4.143"/>
									<id root="9a6d1bac-17d3-4195-89a4-1121bc809b4d"/>
									<code code="225773000" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT" displayName="preference"/>
									<effectiveTime value="20130615"/>
									<value xsi:type="CD" code="394848005" codeSystem="2.16.840.1.113883.6.96" displayName="Normal priority"/>
								</observation>
							</entryRelationship>
						</observation>
					</entry>
					<entry>
						<act moodCode="INT" classCode="ACT">
							<!-- Nutrition Recommendation ACT-->
							<templateId root="2.16.840.1.113883.10.20.22.4.130"/>
							<id root="9a6d1bac-17d3-4195-89a4-1121bc809a5c"/>
							<code code="61310001" displayName="nutrition eduction" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
							<statusCode code="active"/>
							<effectiveTime value="20130731"/>
						</act>
					</entry>
				</section>
			</component>
			<!--
		
********************************************************
PROBLEM SECTION v2
********************************************************
-->
			<component>
				<section>
					<!--  *** Problems section with entries required *** -->
					<templateId root="2.16.840.1.113883.10.20.22.2.5.1" extension="2014-06-09"/>
					<code code="11450-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PROBLEM LIST"/>
					<title>PROBLEMS</title>
					<text>
						<paragraph>Active Concerns</paragraph>
						<list>
							<item>Problem #1<list>
									<item>Type II diabetes mellitus with ulcer (onset July 3, 2000)[authored Aug 14, 2013]</item>
								</list>
							</item>
							<item>Problem #2<list>
									<item>Mixed Asthma (onset Apr 14, 2007) [authored Apr 14, 2007]</item>
									<item>Acute Asthma (onset Apr 17, 2007) [authored Apr 17, 2007]</item>
								</list>
							</item>
						</list>
						<paragraph>Resolved Concerns</paragraph>
						<list>
							<item>Problem #3<list>
									<item>Pneumonia - Left lower lobe (onset Mar 10, 1998; resolution Mar 16, 1998) [authored Mar 16,
                    1998]</item>
								</list>
							</item>
						</list>
					</text>
					<entry typeCode="DRIV">
						<act classCode="ACT" moodCode="EVN">
							<!-- ** Problem concern act ** -->
							<templateId root="2.16.840.1.113883.10.20.22.4.3" extension="2014-06-09"/>
							<id root="ec8a6ff8-ed4b-4f7e-82c3-e98e58b45de7"/>
							<code code="CONC" codeSystem="2.16.840.1.113883.5.6" displayName="Concern"/>
							<!-- The statusCode represents the need to continue tracking the problem -->
							<!-- This is of ongoing concern to the provider -->
							<statusCode code="active"/>
							<effectiveTime>
								<!-- The low value represents when the problem was first recorded in the patient's chart -->
								<!-- Concern was documented on July 6, 2013 -->
								<low value="201307061145-0800"/>
							</effectiveTime>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<!-- Same as Concern effectiveTime/low -->
								<time value="201307061145-0800"/>
								<assignedAuthor>
									<id extension="555555555" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Problem observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2014-06-09"/>
									<id root="ab1791b0-5c71-11db-b0de-0800200c9a66"/>
									<code code="75323-6" codeSystem="2.16.840.1.113883.5.6" displayName="Condition"/>
									<!-- The statusCode reflects the status of the observation itself -->
									<statusCode code="completed"/>
									<effectiveTime>
										<!-- The low value reflects the date of onset -->
										<!-- Based on patient symptoms, presumed onset is July 3, 2013 -->
										<low value="20000703"/>
										<!-- The high value reflects when the problem was known to be resolved -->
									</effectiveTime>
									<value xsi:type="CD" code="190389009" codeSystem="2.16.840.1.113883.6.96" displayName="Type II diabetes mellitus with ulcer (disorder)"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="20130730"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<entryRelationship typeCode="REFR">
										<observation classCode="OBS" moodCode="EVN">
											<!-- Problem status observation V2 template -->
											<templateId root="2.16.840.1.113883.10.20.22.4.6" extension="2014-06-09"/>
											<code code="33999-4" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Status"/>
											<statusCode code="completed"/>
											<value xsi:type="CD" code="55561003" codeSystem="2.16.840.1.113883.6.96" displayName="Active" codeSystemName="SNOMED CT"/>
										</observation>
									</entryRelationship>
								</observation>
							</entryRelationship>
						</act>
					</entry>
					<entry typeCode="DRIV">
						<act classCode="ACT" moodCode="EVN">
							<!-- Problem concern act ** -->
							<templateId root="2.16.840.1.113883.10.20.22.4.3" extension="2014-06-09"/>
							<id root="682f6be1-0793-42f4-904b-e199e6e8e457"/>
							<code code="CONC" codeSystem="2.16.840.1.113883.5.6" displayName="Concern"/>
							<!-- The statusCode represents the need to continue tracking the problem -->
							<statusCode code="active"/>
							<!-- This is of ongoing concern to the provider -->
							<effectiveTime>
								<!-- The low value represents when the problem was first recorded in the patient's chart -->
								<low value="200704141515-0800"/>
								<!-- Concern was documented on Apr 14, 2007 -->
							</effectiveTime>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="200704141515-0800"/>
								<!-- Same as Concern effectiveTime/low -->
								<assignedAuthor>
									<id extension="555555555" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Problem observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2014-06-09"/>
									<id root="11d088a8-b957-401c-8ee0-3bd20a772fc0"/>
									<code code="75323-6" codeSystem="2.16.840.1.113883.5.6" codeSystemName="LOINC" displayName="Condition"/>
									<!-- The statusCode reflects the status of the observation itself -->
									<statusCode code="completed"/>
									<effectiveTime>
										<!-- The low value reflects the date of onset -->
										<low value="20070414"/>
										<!-- Based on patient symptoms, presumed onset is July 3, 2013 -->
										<!-- Absence of effectiveTime/high means the condition is not resolved -->
									</effectiveTime>
									<value xsi:type="CD" code="195977004" codeSystem="2.16.840.1.113883.6.96" displayName="mixed asthma"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="200704141515-0800"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Problem observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2014-06-09"/>
									<id root="4991db40-4c4f-41e8-9146-50c12d716424"/>
									<code code="75323-6" codeSystem="2.16.840.1.113883.5.6" codeSystemName="LOINC" displayName="Condition"/>
									<!-- The statusCode reflects the status of the observation itself -->
									<statusCode code="completed"/>
									<effectiveTime>
										<!-- The low value reflects the date of onset -->
										<low value="20070417"/>
										<!-- Absence of effectiveTime/high means the condition is not resolved -->
									</effectiveTime>
									<value xsi:type="CD" code="304527002" codeSystem="2.16.840.1.113883.6.96" displayName="Acute Asthma"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="200704171515-0800"/>
										<assignedAuthor>
											<id extension="222334444" root="2.16.840.1.113883.4.6"/>
											<code code="207QA0505X" displayName="Adult Medicine" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
						</act>
					</entry>
					<entry typeCode="DRIV">
						<act classCode="ACT" moodCode="EVN">
							<!-- ** Problem concern act ** -->
							<templateId root="2.16.840.1.113883.10.20.22.4.3" extension="2014-06-09"/>
							<id root="b5159d48-04aa-4927-b355-00d1dcb7158c"/>
							<code code="CONC" codeSystem="2.16.840.1.113883.5.6" displayName="Concern"/>
							<!-- The statusCode represents the need to continue tracking the problem -->
							<!-- This is no longer of ongoing concern to the provider -->
							<statusCode code="completed"/>
							<effectiveTime>
								<!-- The low value represents when the problem was first recorded in the patient's chart -->
								<!-- Concern was documented on Mar 10, 1998 -->
								<low value="199803101030-0800"/>
							</effectiveTime>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<!-- Same as Concern effectiveTime/low -->
								<time value="199803161030-0800"/>
								<assignedAuthor>
									<id extension="555555555" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Problem observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.4" extension="2014-06-09"/>
									<id root="10506b4d-c30a-4220-8bec-97bff9568fd1"/>
									<code code="75323-6" codeSystem="2.16.840.1.113883.5.6" codeSystemName="LOINC" displayName="Condition"/>
									<!-- The statusCode reflects the status of the observation itself -->
									<statusCode code="completed"/>
									<effectiveTime>
										<!-- The low value reflects the date of onset -->
										<!-- Based on patient symptoms, presumed onset is Mar 10, 1998 -->
										<low value="19980310"/>
										<!-- The high value reflects when the problem was known to be resolved -->
										<high value="19980316"/>
									</effectiveTime>
									<value xsi:type="CD" code="233604007" codeSystem="2.16.840.1.113883.6.96" displayName="Pneumonia">
										<qualifier>
											<name code="363698007" displayName="Finding site"/>
											<value code="41224006" displayName="Left lower lobe of lung"/>
										</qualifier>
									</value>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="199803161030-0800"/>
										<assignedAuthor>
											<id extension="555555555" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
								</observation>
							</entryRelationship>
						</act>
					</entry>
				</section>
			</component>
			<!--
********************************************************
REASON FOR REFERRAL V2
********************************************************
-->
			<component>
				<section>
					<templateId root="1.3.6.1.4.1.19376.1.5.3.1.3.1" extension="2014-06-09"/>
					<code code="42349-1" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="Reason for Referral "/>
					<title>REASON FOR REFERRAL</title>
					<text>
						<content>Request for consultation for weight management.</content>
						<content>Patient referral for consultation for full care. Referral Nurse: Nurse Florence,RN</content>
					</text>
					<entry>
						<act classCode="PCPR" moodCode="INT">
							<!--Patient Referral Act-->
							<templateId root="2.16.840.1.113883.10.20.22.4.140"/>
							<id root="70bdd7db-e02d-4eff-9829-35e3b7d9e154"/>
							<code code="44383000" displayName="Patient referral for consultation" codeSystemName="SNOMED CT" codeSystem="2.16.840.1.113883.6.96"> </code>
							<statusCode code="active"/>
							<effectiveTime value="20130930"/>
							<priorityCode code="A" codeSystem="2.16.840.1.113883.5.7" codeSystemName="ActPriority" displayName="ASAP"/>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="20130730"/>
								<assignedAuthor>
									<id root="d839038b-7171-4165-a760-467925b43857"/>
									<code code="163W00000X" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)" displayName="Registered nurse"/>
									<assignedPerson>
										<name>
											<given>Nurse</given>
											<family>Florence</family>
											<suffix>RN</suffix>
										</name>
									</assignedPerson>
								</assignedAuthor>
							</author>
							<entryRelationship typeCode="SUBJ">
								<observation classCode="OBS" moodCode="EVN">
									<code code="ASSERTION" codeSystem="2.16.840.1.113883.5.4"/>
									<statusCode code="completed"/>
									<value xsi:type="CD" code="268528005" displayName="full care by specialist" codeSystem="2.16.840.1.113883.6.96"/>
								</observation>
							</entryRelationship>
						</act>
					</entry>
				</section>
			</component>
			<!--
********************************************************
RESULTS SECTION V2
********************************************************
-->
			<component>
				<section>
					<!-- Results section with entries required -->
					<templateId root="2.16.840.1.113883.10.20.22.2.3.1" extension="2014-06-09"/>
					<code code="30954-2" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="RESULTS"/>
					<title>RESULTS</title>
					<text>
						<table>
							<thead>
								<tr>
									<th>Result Type</th>
									<th>Result Value</th>
									<th>Relevant Reference Range</th>
									<th>Interpretation</th>
									<th>Date</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td ID="result1">Hemoglobin</td>
									<td ID="resultvalue1">13.2 g/dL</td>
									<td ID="referencerange1">Normal range for women is 12.0 to 15.5 grams per deciliter</td>
									<td>Normal</td>
									<td>July 31, 2013</td>
								</tr>
								<tr>
									<td ID="result2">Leukocytes</td>
									<td ID="resultvalue2">6.7 10*9/L</td>
									<td ID="referencerange2">Normal white blood cell count range 3.5-10.5 billion cells/L</td>
									<td>Normal</td>
									<td>July 31, 2013</td>
								</tr>
								<tr>
									<td ID="result3">Platelets</td>
									<td ID="resultvalue3">123 10*9/L</td>
									<td ID="referencerange3">Normal white blood cell count range 3.5-10.5 billion cells/L</td>
									<td>Low</td>
									<td>July 31, 2013</td>
								</tr>
								<tr>
									<td ID="result4">Hematocrit</td>
									<td ID="resultvalue4">35.3 %</td>
									<td ID="referencerange4">Normal hematocrit range for female: 34.9-44.5 percent</td>
									<td>Normal</td>
									<td>July 31, 2013</td>
								</tr>
								<tr>
									<td ID="result5">Erythrocytes</td>
									<td ID="resultvalue5">4.21 10*12/L</td>
									<td ID="referencerange5">Normal red blood cell count range 3.90-5.03 trillion cells/L</td>
									<td>Normal</td>
									<td>July 31, 2013</td>
								</tr>
								<tr>
									<td ID="result6">Urea nitrogen, Serum</td>
									<td>Pending</td>
									<td>Pending</td>
									<td>Pending</td>
									<td>July 31, 2013</td>
								</tr>
							</tbody>
						</table>
					</text>
					<entry typeCode="DRIV">
						<organizer classCode="BATTERY" moodCode="EVN">
							<!-- ** Result organizer ** -->
							<templateId root="2.16.840.1.113883.10.20.22.4.1" extension="2014-06-09"/>
							<id root="7d5a02b0-67a4-11db-bd13-0800200c9a66"/>
							<code code="57021-8" displayName="CBC W Auto Differential panel in Blood" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
							<statusCode code="completed"/>
							<effectiveTime>
								<low value="201303110830-0800"/>
								<high value="201303110830-0800"/>
							</effectiveTime>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="107c2dc0-67a5-11db-bd13-0800200c9a66"/>
									<code code="718-7" displayName="Hemoglobin" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="201303110830-0800"/>
									<value xsi:type="PQ" value="13.2" unit="g/dL"/>
									<interpretationCode code="N" codeSystem="2.16.840.1.113883.5.83"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201303110830-0800"/>
										<assignedAuthor>
											<id extension="333444444" root="2.16.840.1.113883.4.6"/>
											<code code="246Q00000X" displayName="Technician, Pathology" codeSystem="2.16.840.1.113883.6.101" codeSystemName="Healthcare Provider Taxonomy (HIPAA)"/>
										</assignedAuthor>
									</author>
									<referenceRange>
										<observationRange>
											<value xsi:type="IVL_PQ">
												<low value="12.0" unit="g/dL"/>
												<high value="15.5" unit="g/dL"/>
											</value>
										</observationRange>
									</referenceRange>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="a69b3d60-2ffd-4440-958b-72b3335ff35f"/>
									<code code="6690-2" displayName="Leukocytes" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="201303110830-0800"/>
									<value xsi:type="PQ" value="6.7" unit="10*9/L">
										<translation>
											<originalText>6.7 billion per liter</originalText>
										</translation>
									</value>
									<interpretationCode code="N" codeSystem="2.16.840.1.113883.5.83"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201303110830-0800"/>
										<assignedAuthor>
											<id extension="333444444" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<referenceRange>
										<observationRange>
											<value xsi:type="IVL_PQ">
												<low value="4.3" unit="10*9/L"/>
												<high value="10.8" unit="10*9/L"/>
											</value>
										</observationRange>
									</referenceRange>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="ef5c1c58-4665-4556-a8e8-6e720d82f572"/>
									<code code="777-3" displayName="Platelets" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<text>
										<reference value="#result3"/>
									</text>
									<statusCode code="completed"/>
									<effectiveTime value="201303110830-0800"/>
									<value xsi:type="PQ" value="123" unit="10*9/L"/>
									<interpretationCode code="A" codeSystem="2.16.840.1.113883.5.83"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201303110830-0800"/>
										<assignedAuthor>
											<id extension="333444444" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<referenceRange>
										<observationRange>
											<value xsi:type="IVL_PQ">
												<low value="150" unit="10*9/L"/>
												<high value="350" unit="10*9/L"/>
											</value>
										</observationRange>
									</referenceRange>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="7c0704bb-9c40-41b5-9c7d-26b2d59e234f"/>
									<code code="4544-3" displayName="Hematocrit" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<text>
										<reference value="#result4"/>
									</text>
									<statusCode code="completed"/>
									<effectiveTime value="201303110830-0800"/>
									<value xsi:type="PQ" value="35.3" unit="%"/>
									<interpretationCode code="A" codeSystem="2.16.840.1.113883.5.83"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201303110830-0800"/>
										<assignedAuthor>
											<id extension="333444444" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<referenceRange>
										<observationRange>
											<value xsi:type="IVL_PQ">
												<low value="34.9" unit="%"/>
												<high value="44.5" unit="%"/>
											</value>
										</observationRange>
									</referenceRange>
								</observation>
							</component>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="bccd6fc9-0c7f-455e-8616-923ed0d04d09"/>
									<code code="789-8" displayName="Erythrocytes" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="completed"/>
									<effectiveTime value="201303110830-0800"/>
									<value xsi:type="PQ" value="4.21" unit="10*12/L"/>
									<interpretationCode code="N" codeSystem="2.16.840.1.113883.5.83"/>
									<author typeCode="AUT">
										<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
										<time value="201303110830-0800"/>
										<assignedAuthor>
											<id extension="333444444" root="2.16.840.1.113883.4.6"/>
										</assignedAuthor>
									</author>
									<referenceRange>
										<observationRange>
											<value xsi:type="IVL_PQ">
												<low value="3.90" unit="10*12/L"/>
												<high value="5.03" unit="10*12/L"/>
											</value>
										</observationRange>
									</referenceRange>
								</observation>
							</component>
						</organizer>
					</entry>
					<entry typeCode="DRIV">
						<organizer classCode="BATTERY" moodCode="EVN">
							<!-- ** Result organizer ** -->
							<templateId root="2.16.840.1.113883.10.20.22.4.1" extension="2014-06-09"/>
							<id root="122ed3ae-6d9e-43d0-bfa2-434ea34b1426"/>
							<code code="166312007" displayName="Blood chemistry test" codeSystem="2.16.840.1.113883.6.96" codeSystemName="SNOMED CT"/>
							<statusCode code="active"/>
							<effectiveTime>
								<low value="200803200930-0800"/>
								<high value="200803200930-0800"/>
							</effectiveTime>
							<author typeCode="AUT">
								<templateId root="2.16.840.1.113883.10.20.22.4.119"/>
								<time value="201303110830-0800"/>
								<assignedAuthor>
									<id extension="333444444" root="2.16.840.1.113883.4.6"/>
								</assignedAuthor>
							</author>
							<component>
								<observation classCode="OBS" moodCode="EVN">
									<!-- ** Result observation ** -->
									<templateId root="2.16.840.1.113883.10.20.22.4.2" extension="2014-06-09"/>
									<id root="aed821af-3330-4138-97f0-e84dfe5f3c35"/>
									<code code="3094-0" displayName="Urea nitrogen, Serum" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
									<statusCode code="active"/>
									<effectiveTime value="200803200930-0800"/>
									<value xsi:type="PQ" nullFlavor="NI"/>
								</observation>
							</component>
						</organizer>
					</entry>
				</section>
			</component>
			<!--
********************************************************
VITAL SIGNS SECTION V2
********************************************************
-->
<#if ehr_observations?has_content>
<#include "vital_signs.ftl">
<#else>
<#include "vital_signs_no_current.ftl" parse=false>
</#if>
		</structuredBody>
	</component>
</ClinicalDocument>