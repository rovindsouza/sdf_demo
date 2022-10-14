view: zendesk_events {
    
        sql_table_name: `mozilla-cdp-prod`.zendesk.zendesk_events ;;
    
    
    
    dimension_group: created_date {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Created Date"
        
        sql: ${TABLE}.created_date;;
        
    }
    
    
    dimension: current_user_details {
        type: string
        
        label: "Current User Details"
        
        sql: ${TABLE}.current_user_details;;
        
    }
    
    
    dimension: current_user_email {
        type: string
        
        label: "Current User Email"
        
        sql: ${TABLE}.current_user_email;;
        
    }
    
    
    dimension: current_user_external_id {
        type: string
        
        label: "Current User External Id"
        
        sql: ${TABLE}.current_user_external_id;;
        
    }
    
    
    dimension: current_user_first_name {
        type: string
        
        label: "Current User First Name"
        
        sql: ${TABLE}.current_user_first_name;;
        
    }
    
    
    dimension: current_user_language {
        type: string
        
        label: "Current User Language"
        
        sql: ${TABLE}.current_user_language;;
        
    }
    
    
    dimension: current_user_name {
        type: string
        
        label: "Current User Name"
        
        sql: ${TABLE}.current_user_name;;
        
    }
    
    
    dimension: current_user_notes {
        type: string
        
        label: "Current User Notes"
        
        sql: ${TABLE}.current_user_notes;;
        
    }
    
    
    dimension: current_user_organization_details {
        type: string
        
        label: "Current User Organization Details"
        
        sql: ${TABLE}.current_user_organization_details;;
        
    }
    
    
    dimension: current_user_organization_name {
        type: string
        
        label: "Current User Organization Name"
        
        sql: ${TABLE}.current_user_organization_name;;
        
    }
    
    
    dimension: current_user_organization_notes {
        type: string
        
        label: "Current User Organization Notes"
        
        sql: ${TABLE}.current_user_organization_notes;;
        
    }
    
    
    dimension: current_user_phone {
        type: string
        
        label: "Current User Phone"
        
        sql: ${TABLE}.current_user_phone;;
        
    }
    
    
    dimension: date_parameter_filter__m_ {
        type: yesno
        
        label: "Date Parameter Filter (m)"
        sql: ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872} = DATETRUNC('month', ${ticket_created_at_ts_raw});;
        
    }
    
    
    dimension: date_parameter_filter__w_ {
        type: yesno
        
        label: "Date Parameter Filter (w)"
        sql: ${Parameters}.${Parameter 1} = DATETRUNC('week', ${ticket_created_at_ts_raw});;
        
    }
    
    
    dimension: integration_type {
        type: string
        
        label: "Integration Type"
        
        sql: ${TABLE}.integration_type;;
        
    }
    
    
    dimension: no_reponse {
        type: string
        
        label: "No Reponse"
        sql: if ISNULL(${ticket_updated_at_ts_raw} ) THEN 'No Response'


ELSE 'Response'

end;;
        
    }
    
    
    dimension: satisfaction_current_comment {
        type: string
        
        label: "Satisfaction Current Comment"
        
        sql: ${TABLE}.satisfaction_current_comment;;
        
    }
    
    
    dimension: satisfaction_current_rating {
        type: string
        
        label: "Satisfaction Current Rating"
        
        sql: ${TABLE}.satisfaction_current_rating;;
        
    }
    
    
    dimension: solved__<=72hrs_ {
        type: string
        
        label: "Solved (<=72hrs)"
        sql: if { FIXED ${ticket_id} :  
AVG( if   ${ticket_status}="Solved" 


THEN { FIXED  ${ticket_id} : AVG(

 { FIXED ${ticket_id} : AVG( DATEDIFF('minute', ${ticket_created_at_ts_raw}, 

{ FIXED  ${ticket_id} :  MIN( ${ticket_updated_at_ts_raw}) }  ) )  } / 60

) }



end ) } <=72 THEN 'Yes' 

ELSE 'No'

end;;
        
    }
    
    
    dimension: solved_rate__<=72hrs__change_color__week_ {
        type: string
        
        label: "Solved Rate (<=72hrs) change color (week)"
        sql: if ${solved_rate__=<72hrs__change__week_} > 0 THEN "▲"

ELSEIF  ${solved_rate__=<72hrs__change__week_} = 0 THEN " "

ELSE "▼"

end;;
        
    }
    
    
    dimension: split_1 {
        type: string
        
        label: "Split 1"
        sql: SPLIT(${tags}, ' ', 1);;
        
    }
    
    
    dimension: split_2 {
        type: string
        
        label: "Split 2"
        sql: SPLIT(${tags}, ' ', 2);;
        
    }
    
    
    dimension: split_3 {
        type: string
        
        label: "Split 3"
        sql: SPLIT(${tags}, ' ', 3);;
        
    }
    
    
    dimension: tags {
        type: string
        
        label: "Tags"
        sql: TRIM(REGEXP_REPLACE(${ticket_tags}, "vpn",""));;
        
    }
    
    
    dimension: ticke_update_min_date_exclusion_ {
        type: string
        
        label: "Ticke Update Min Date Exclusion "
        sql: If ${ticket_updated_at_ts_raw} = ${ticket_created_at_ts_raw} THEN "exclude" else "include" end;;
        
    }
    
    
    dimension: ticket_about {
        type: string
        
        label: "Ticket About"
        
        sql: ${TABLE}.ticket_about;;
        
    }
    
    
    dimension: ticket_account {
        type: string
        
        label: "Ticket Account"
        
        sql: ${TABLE}.ticket_account;;
        
    }
    
    
    dimension: ticket_agent_hours {
        type: string
        
        label: "Ticket Agent Hours"
        
        sql: ${TABLE}.ticket_agent_hours;;
        
    }
    
    
    dimension: ticket_allow_mozilla_to_collect_device_data {
        type: string
        
        label: "Ticket Allow Mozilla To Collect Device Data"
        
        sql: ${TABLE}.ticket_allow_mozilla_to_collect_device_data;;
        
    }
    
    
    dimension: ticket_assignee_email {
        type: string
        
        label: "Ticket Assignee Email"
        
        sql: ${TABLE}.ticket_assignee_email;;
        
    }
    
    
    dimension: ticket_assignee_first_name {
        type: string
        
        label: "Ticket Assignee First Name"
        
        sql: ${TABLE}.ticket_assignee_first_name;;
        
    }
    
    
    dimension: ticket_assignee_last_name {
        type: string
        
        label: "Ticket Assignee Last Name"
        
        sql: ${TABLE}.ticket_assignee_last_name;;
        
    }
    
    
    dimension: ticket_brand_name {
        type: string
        
        label: "Ticket Brand Name"
        
        sql: ${TABLE}.ticket_brand_name;;
        
    }
    
    
    dimension: ticket_bug_description {
        type: string
        
        label: "Ticket Bug Description"
        
        sql: ${TABLE}.ticket_bug_description;;
        
    }
    
    
    dimension: ticket_bugzilla_id {
        type: string
        
        label: "Ticket Bugzilla Id"
        
        sql: ${TABLE}.ticket_bugzilla_id;;
        
    }
    
    
    dimension: ticket_category_in_firefox {
        type: string
        
        label: "Ticket Category In Firefox"
        
        sql: ${TABLE}.ticket_category_in_firefox;;
        
    }
    
    
    dimension: ticket_channel_identification {
        type: string
        
        label: "Ticket Channel Identification"
        
        sql: ${TABLE}.ticket_channel_identification;;
        
    }
    
    
    dimension_group: ticket_created_at_ts {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "ticket_created_at_ts"
        
        sql: ${TABLE}.ticket_created_at_ts;;
        
    }
    
    
    dimension: ticket_delete_ticket_30_days_after_resolution {
        type: string
        
        label: "Ticket Delete Ticket 30 Days After Resolution"
        
        sql: ${TABLE}.ticket_delete_ticket_30_days_after_resolution;;
        
    }
    
    
    dimension: ticket_description {
        type: string
        
        label: "Ticket Description"
        
        sql: ${TABLE}.ticket_description;;
        
    }
    
    
    dimension: ticket_due_date {
        type: string
        
        label: "Ticket Due Date"
        
        sql: ${TABLE}.ticket_due_date;;
        
    }
    
    
    dimension: ticket_engineering_hours {
        type: string
        
        label: "Ticket Engineering Hours"
        
        sql: ${TABLE}.ticket_engineering_hours;;
        
    }
    
    
    dimension: ticket_escalate_to_fxe_sd2 {
        type: string
        
        label: "Ticket Escalate To Fxe Sd2"
        
        sql: ${TABLE}.ticket_escalate_to_fxe_sd2;;
        
    }
    
    
    dimension: ticket_escalate_to_fxe_sd3 {
        type: string
        
        label: "Ticket Escalate To Fxe Sd3"
        
        sql: ${TABLE}.ticket_escalate_to_fxe_sd3;;
        
    }
    
    
    dimension: ticket_escalate_to_sub_serv_sd2 {
        type: string
        
        label: "Ticket Escalate To Sub Serv Sd2"
        
        sql: ${TABLE}.ticket_escalate_to_sub_serv_sd2;;
        
    }
    
    
    dimension: ticket_escalate_to_sub_serv_sd3 {
        type: string
        
        label: "Ticket Escalate To Sub Serv Sd3"
        
        sql: ${TABLE}.ticket_escalate_to_sub_serv_sd3;;
        
    }
    
    
    dimension: ticket_external_id {
        type: string
        
        label: "Ticket External Id"
        
        sql: ${TABLE}.ticket_external_id;;
        
    }
    
    
    dimension: ticket_firefox_version {
        type: string
        
        label: "Ticket Firefox Version"
        
        sql: ${TABLE}.ticket_firefox_version;;
        
    }
    
    
    dimension: ticket_fx_user {
        type: string
        
        label: "Ticket Fx User"
        
        sql: ${TABLE}.ticket_fx_user;;
        
    }
    
    
    dimension: ticket_fxa_consent {
        type: string
        
        label: "Ticket Fxa Consent"
        
        sql: ${TABLE}.ticket_fxa_consent;;
        
    }
    
    
    dimension: ticket_fxa_description {
        type: string
        
        label: "Ticket Fxa Description"
        
        sql: ${TABLE}.ticket_fxa_description;;
        
    }
    
    
    dimension: ticket_fxa_subject {
        type: string
        
        label: "Ticket Fxa Subject"
        
        sql: ${TABLE}.ticket_fxa_subject;;
        
    }
    
    
    dimension: ticket_fxa_ticket_reason {
        type: string
        
        label: "Ticket Fxa Ticket Reason"
        
        sql: ${TABLE}.ticket_fxa_ticket_reason;;
        
    }
    
    
    dimension: ticket_group_name {
        type: string
        
        label: "Ticket Group Name"
        
        sql: ${TABLE}.ticket_group_name;;
        
    }
    
    
    dimension: ticket_hardware_details {
        type: string
        
        label: "Ticket Hardware Details"
        
        sql: ${TABLE}.ticket_hardware_details;;
        
    }
    
    
    dimension: ticket_id {
        type: string
        
        label: "Ticket Id"
        
        sql: ${TABLE}.ticket_id;;
        
    }
    
    
    dimension: ticket_latest_comment {
        type: string
        
        label: "Ticket Latest Comment"
        
        sql: ${TABLE}.ticket_latest_comment;;
        
    }
    
    
    dimension: ticket_latest_public_comment {
        type: string
        
        label: "Ticket Latest Public Comment"
        
        sql: ${TABLE}.ticket_latest_public_comment;;
        
    }
    
    
    dimension: ticket_number_of_solved_follow_ups {
        type: string
        
        label: "Ticket Number Of Solved Follow Ups"
        
        sql: ${TABLE}.ticket_number_of_solved_follow_ups;;
        
    }
    
    
    dimension: ticket_operating_sys_type {
        type: string
        
        label: "Ticket Operating Sys Type"
        
        sql: ${TABLE}.ticket_operating_sys_type;;
        
    }
    
    
    dimension: ticket_operating_sys_version {
        type: string
        
        label: "Ticket Operating Sys Version"
        
        sql: ${TABLE}.ticket_operating_sys_version;;
        
    }
    
    
    dimension: ticket_organization_custom_fields_product_line {
        type: string
        
        label: "Ticket Organization Custom Fields Product Line"
        
        sql: ${TABLE}.ticket_organization_custom_fields_product_line;;
        
    }
    
    
    dimension: ticket_organization_custom_fields_salesforce_id {
        type: string
        
        label: "Ticket Organization Custom Fields Salesforce Id"
        
        sql: ${TABLE}.ticket_organization_custom_fields_salesforce_id;;
        
    }
    
    
    dimension: ticket_organization_details {
        type: string
        
        label: "Ticket Organization Details"
        
        sql: ${TABLE}.ticket_organization_details;;
        
    }
    
    
    dimension: ticket_organization_external_id {
        type: string
        
        label: "Ticket Organization External Id"
        
        sql: ${TABLE}.ticket_organization_external_id;;
        
    }
    
    
    dimension: ticket_organization_name {
        type: string
        
        label: "Ticket Organization Name"
        
        sql: ${TABLE}.ticket_organization_name;;
        
    }
    
    
    dimension: ticket_organization_notes {
        type: string
        
        label: "Ticket Organization Notes"
        
        sql: ${TABLE}.ticket_organization_notes;;
        
    }
    
    
    dimension: ticket_preferred_email {
        type: string
        
        label: "Ticket Preferred Email"
        
        sql: ${TABLE}.ticket_preferred_email;;
        
    }
    
    
    dimension: ticket_priority {
        type: string
        
        label: "Ticket Priority"
        
        sql: ${TABLE}.ticket_priority;;
        
    }
    
    
    dimension: ticket_product_label {
        type: string
        
        label: "Ticket Product Label"
        
        sql: ${TABLE}.ticket_product_label;;
        
    }
    
    
    dimension: ticket_requester_details {
        type: string
        
        label: "Ticket Requester Details"
        
        sql: ${TABLE}.ticket_requester_details;;
        
    }
    
    
    dimension: ticket_requester_email {
        type: string
        
        label: "Ticket Requester Email"
        
        sql: ${TABLE}.ticket_requester_email;;
        
    }
    
    
    dimension: ticket_requester_external_id {
        type: string
        
        label: "Ticket Requester External Id"
        
        sql: ${TABLE}.ticket_requester_external_id;;
        
    }
    
    
    dimension: ticket_requester_first_name {
        type: string
        
        label: "Ticket Requester First Name"
        
        sql: ${TABLE}.ticket_requester_first_name;;
        
    }
    
    
    dimension: ticket_requester_language {
        type: string
        
        label: "Ticket Requester Language"
        
        sql: ${TABLE}.ticket_requester_language;;
        
    }
    
    
    dimension: ticket_requester_last_name {
        type: string
        
        label: "Ticket Requester Last Name"
        
        sql: ${TABLE}.ticket_requester_last_name;;
        
    }
    
    
    dimension: ticket_requester_name {
        type: string
        
        label: "Ticket Requester Name"
        
        sql: ${TABLE}.ticket_requester_name;;
        
    }
    
    
    dimension: ticket_requester_phone {
        type: string
        
        label: "Ticket Requester Phone"
        
        sql: ${TABLE}.ticket_requester_phone;;
        
    }
    
    
    dimension: ticket_requester_requester_field {
        type: string
        
        label: "Ticket Requester Requester Field"
        
        sql: ${TABLE}.ticket_requester_requester_field;;
        
    }
    
    
    dimension_group: ticket_response_min {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "ticket response min"
        sql: {fixed ${ticket_id}, ${ticket_created_at_ts_raw} : MIN(${ticket_updated_at_ts_raw})};;
        
    }
    
    
    dimension: ticket_software_env_details {
        type: string
        
        label: "Ticket Software Env Details"
        
        sql: ${TABLE}.ticket_software_env_details;;
        
    }
    
    
    dimension: ticket_status {
        type: string
        
        label: "Ticket Status"
        
        sql: ${TABLE}.ticket_status;;
        
    }
    
    
    dimension: ticket_subscription_services_category {
        type: string
        
        label: "Ticket Subscription Services Category"
        
        sql: ${TABLE}.ticket_subscription_services_category;;
        
    }
    
    
    dimension: ticket_support_category {
        type: string
        
        label: "Ticket Support Category"
        
        sql: ${TABLE}.ticket_support_category;;
        
    }
    
    
    dimension: ticket_tags {
        type: string
        
        label: "Ticket Tags"
        
        sql: ${TABLE}.ticket_tags;;
        
    }
    
    
    dimension: ticket_ticket_form {
        type: string
        
        label: "ticket_ticket_form"
        
        sql: ${TABLE}.ticket_ticket_form;;
        
    }
    
    
    dimension: ticket_title {
        type: string
        
        label: "Ticket Title"
        
        sql: ${TABLE}.ticket_title;;
        
    }
    
    
    dimension: ticket_type {
        type: string
        
        label: "Ticket Type"
        
        sql: ${TABLE}.ticket_type;;
        
    }
    
    
    dimension_group: ticket_updated_at_ts {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "ticket_updated_at_ts"
        
        sql: ${TABLE}.ticket_updated_at_ts;;
        
    }
    
    
    dimension: ticket_urgency {
        type: string
        
        label: "Ticket Urgency"
        
        sql: ${TABLE}.ticket_urgency;;
        
    }
    
    
    dimension: ticket_url {
        type: string
        
        label: "Ticket Url"
        
        sql: ${TABLE}.ticket_url;;
        
    }
    
    
    dimension: ticket_users_affected {
        type: string
        
        label: "Ticket Users Affected"
        
        sql: ${TABLE}.ticket_users_affected;;
        
    }
    
    
    dimension: ticket_via {
        type: string
        
        label: "Ticket Via"
        
        sql: ${TABLE}.ticket_via;;
        
    }
    
    
    dimension: vpn_ticket_tag_filter {
        type: string
        
        label: "VPN Ticket Tag Filter"
        sql: IF CONTAINS(${ticket_tags}, "vpn") THEN "VPN" else "Others" END;;
        
    }
    
    
    measure: _response_(hrs)_change%_color_(w) {
        label: " Response (Hrs) Change% Color (w)"
        type: number
        sql: if ${first_response__hrs__change_#__week_} > 0 THEN "▲"

ELSEIF  ${first_response__hrs__change_#__week_} = 0 THEN " "

ELSE "▼"

end ;;
    }
    
    measure: first_response_(<=48_hrs)_change%_col_(w) {
        label: "First Response (<=48 Hrs) Change% Col (w)"
        type: number
        sql: if  SUM(${first_response__<=48hrs___change___w_}) >0 THEN "▲"

ELSEIF  SUM(${first_response__<=48hrs___change___w_}) = 0 THEN " "

ELSE "▼"

end ;;
    }
    
    measure: first_response_(<=48hrs)_ {
        label: "First Response (<=48hrs) "
        type: number
        sql: COUNTD(if  ${first_response__hrs_} <= 48  THEN ${ticket_id} END) 

/  COUNTD(${ticket_id}) ;;
    }
    
    measure: first_response_(<=48hrs)_(change)_(w) {
        label: "First Response (<=48hrs) (change) (w)"
        type: number
        sql: ( { FIXED : MAX(
if DATEADD('week', 0, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${first_response__hrs_} <= 48  THEN ${ticket_id} END ) 

/  COUNTD(${ticket_id})  }   end ) }  

-


{ FIXED : MAX(
if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${first_response__hrs_} <= 48  THEN ${ticket_id} END ) 

/  COUNTD(${ticket_id})  }   end ) }  ) ;;
    }
    
    measure: first_response_(<=48hrs)_previous_month {
        label: "First Response (<=48hrs) Previous Month"
        type: number
        sql: { FIXED : MAX(
if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('month', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${first_response__hrs_} <= 48  THEN ${ticket_id} END ) 

/  COUNTD(${ticket_id})  }   end ) } ;;
    }
    
    measure: first_response_(<=48hrs)_previous_week {
        label: "First Response (<=48hrs) Previous Week"
        type: number
        sql: { FIXED : MAX(
if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${first_response__hrs_} <= 48  THEN ${ticket_id} END ) 

/  COUNTD(${ticket_id})  }   end ) } ;;
    }
    
    measure: first_response_(hrs) {
        label: "First Response (Hrs)"
        type: number
        sql: { FIXED  ${ticket_id} : AVG(

 { FIXED ${ticket_id} : AVG( DATEDIFF('minute', ${ticket_created_at_ts_raw}, 

{ FIXED  ${ticket_id} :  MIN( ${ticket_updated_at_ts_raw}) }  ) )  } / 60

) } ;;
    }
    
    measure: first_response_(hrs)_change%_color_(w) {
        label: "First Response (Hrs) Change% Color (w)"
        type: number
        sql: if ${first_response__hrs__change_#__week_} >= 0 THEN "▲"

ELSEIF  ${first_response__hrs__change_#__week_} = 0 THEN " "

ELSE "▼"

end ;;
    }
    
    measure: first_response_(hrs)_change_#_(week) {
        label: "First Response (Hrs) Change # (week)"
        type: number
        sql: (AVG(${first_response__hrs_})

- 

AVG( { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): AVG(${first_response__hrs_}) }  

end ) 
} ) ) ;;
    }
    
    measure: first_response_time__previous_month {
        label: "First Response Time  Previous Month"
        type: number
        sql: AVG( { FIXED  : AVG(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('month', ${ticket_created_at_ts_raw}): AVG(${first_response__hrs_}) }  

end ) 
} ) ;;
    }
    
    measure: first_response_time_previous_week {
        label: "First Response Time Previous Week"
        type: number
        sql: AVG( { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): AVG(${first_response__hrs_}) }  

end ) 
} ) ;;
    }
    
    measure: number_of_records {
        label: "Number of Records"
        type: number
        sql: 1 ;;
    }
    
    measure: previous_week_#_(w)_(tickets) {
        label: "Previous Week # (w) (tickets)"
        type: number
        sql: SUM(  { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): COUNTD(${ticket_id} ) }  

end ) 
} ) ;;
    }
    
    measure: previous_week_change_# {
        label: "Previous Week Change #"
        type: number
        sql: (COUNTD(${ticket_id}) 

-


SUM(  { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): COUNTD(${ticket_id} ) }  

end ) 
} )) ;;
    }
    
    measure: previous_week_change_color {
        label: "Previous Week Change color"
        type: number
        sql: if ${previous_week_change_#} > 0 THEN "▲"

ELSEIF  ${previous_week_change_#} = 0 THEN " "

ELSE "▼"

end ;;
    }
    
    measure: resolution_time__(hrs) {
        label: "Resolution Time  (Hrs)"
        type: number
        sql: { FIXED  ${ticket_id} : AVG(

 { FIXED ${ticket_id} : AVG( DATEDIFF('minute', ${ticket_created_at_ts_raw}, 

{ FIXED  ${ticket_id} :  MIN( ${ticket_updated_at_ts_raw}) }  ) )  } / 60

) } ;;
    }
    
    measure: resolution_time_change_(week) {
        label: "Resolution Time Change (week)"
        type: number
        sql: (AVG(${resolution_time___hrs_})

- 

AVG( { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): AVG(${resolution_time___hrs_}) }  

end ) 
} ) ) ;;
    }
    
    measure: resolution_time_change_(week)_color {
        label: "Resolution Time Change (week) color"
        type: number
        sql: if ${resolution_time_change__week_} > 0 THEN "▲"

ELSEIF  ${resolution_time_change__week_} = 0 THEN " "

ELSE "▼"

end ;;
    }
    
    measure: resolution_time_previous_month {
        label: "Resolution Time Previous Month"
        type: number
        sql: AVG( { FIXED  : AVG(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('month', ${ticket_created_at_ts_raw}): AVG(${resolution_time___hrs_}) }  

end ) 
} ) ;;
    }
    
    measure: resolution_time_previous_week {
        label: "Resolution Time Previous Week"
        type: number
        sql: AVG( { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): AVG(${resolution_time___hrs_}) }  

end ) 
} ) ;;
    }
    
    measure: solved_rate(<=72hrs) {
        label: "Solved Rate(<=72hrs)"
        type: number
        sql: COUNTD(  if ${Solved (<=72hrs) (copy)_332773794655481864} = 'Yes'  then ${ticket_id}



end ) / COUNTD(${ticket_id}) ;;
    }
    
    measure: solved_rate_(=<72hrs)_change_(week) {
        label: "Solved Rate (=<72hrs) Change (week)"
        type: number
        sql: ( { FIXED : MAX(
if DATEADD('week', 0, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${Solved (<=72hrs) (copy)_332773794655481864} = 'Yes'  THEN ${ticket_id} END) 

/  COUNTD(${ticket_id})  }   end ) }  

-


{ FIXED : MAX(
if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${Solved (<=72hrs) (copy)_332773794655481864} = 'Yes'  THEN ${ticket_id} end ) 

/  COUNTD(${ticket_id})  }   end ) }  ) ;;
    }
    
    measure: solved_rate_(=<72hrs)_previous_month {
        label: "Solved Rate (=<72hrs) Previous Month"
        type: number
        sql: { FIXED : MAX(
if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('month', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${Solved (<=72hrs) (copy)_332773794655481864} = 'Yes'  THEN ${ticket_id} end ) 

/  COUNTD(${ticket_id})  }   end ) } ;;
    }
    
    measure: solved_rate_(=<72hrs)_previous_week {
        label: "Solved Rate (=<72hrs) Previous Week"
        type: number
        sql: { FIXED : MAX(
if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED   DATETRUNC('week', ${ticket_created_at_ts_raw})    :   COUNTD(if  ${Solved (<=72hrs) (copy)_332773794655481864} = 'Yes'  THEN ${ticket_id} end ) 

/  COUNTD(${ticket_id})  }   end ) } ;;
    }
    
    measure: support_category_count {
        label: "Support Category Count"
        type: number
        sql: {FIXED ${ticket_id}: COUNTD(${ticket_support_category})} ;;
    }
    
    measure: ticket_volume {
        label: "Ticket Volume"
        type: number
        sql: COUNTD(${ticket_id}) ;;
    }
    
    measure: total_tickets {
        label: "Total Tickets"
        type: number
        sql: COUNTD(${ticket_id}) ;;
    }
    
    measure: total_tickets_previous_month {
        label: "Total tickets previous month"
        type: number
        sql: SUM(  { FIXED  : AVG(

if DATEADD('month', -1, ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872})  =  DATETRUNC('month', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('month', ${ticket_created_at_ts_raw}): COUNTD(${ticket_id} ) }  

end ) 
} ) ;;
    }
    
    measure: total_tickets_previous_week {
        label: "Total tickets previous week"
        type: number
        sql: SUM(  { FIXED  : AVG(

if DATEADD('week', -1, ${Parameters}.${Parameter 1})  =  DATETRUNC('week', ${ticket_created_at_ts_raw})  THEN  

{ FIXED DATETRUNC('week', ${ticket_created_at_ts_raw}): COUNTD(${ticket_id} ) }  

end ) 
} ) ;;
    }
    
}