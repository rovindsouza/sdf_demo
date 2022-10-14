view: surveygizmo_vw {
    
        sql_table_name: `dp2-prod`.sumo.surveygizmo_vw ;;
    
    
    
    dimension: city {
        type: string
        
        label: "City"
        
        sql: ${TABLE}.city;;
        
    }
    
    
    dimension: contact_id {
        type: number
        
        label: "Contact ID"
        
        sql: ${TABLE}.contact_id;;
        
    }
    
    
    dimension: country {
        type: string
        
        label: "Country"
        
        sql: ${TABLE}.country;;
        
    }
    
    
    dimension: dashboard_feedback_survey_link {
        type: string
        
        label: "Dashboard Feedback Survey Link"
        sql: STR("Dashboard Feedback Survey");;
        
    }
    
    
    dimension: date_for_parameter__m_ {
        type: yesno
        
        label: "Date for Parameter (m)"
        sql: ${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872} = DATETRUNC('month', ${month});;
        
    }
    
    
    dimension: date_for_parameter__w_ {
        type: yesno
        
        label: "Date for Parameter (w)"
        sql: ${Parameters}.${Parameter 1} = DATETRUNC('week', ${week});;
        
    }
    
    
    dimension_group: date_submitted {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Date Submitted"
        
        sql: ${TABLE}.date_submitted;;
        
    }
    
    
    dimension: did_you_accomplish_the_goal_of_your_visit_ {
        type: string
        
        label: "Did you accomplish the goal of your visit"
        
        sql: ${TABLE}.did_you_accomplish_the_goal_of_your_visit_;;
        
    }
    
    
    dimension: how_would_you_rate_your_experience_with_support_mozilla_org__please_help_us_by_only_rating_the_website_and_not_firefox_ {
        type: string
        
        label: "Rating"
        
        sql: ${TABLE}.how_would_you_rate_your_experience_with_support_mozilla_org__please_help_us_by_only_rating_the_website_and_not_firefox_;;
        
    }
    
    
    dimension: language {
        type: string
        
        label: "Language"
        
        sql: ${TABLE}.language;;
        
    }
    
    
    dimension: latitude {
        type: number
        
        label: "Latitude"
        
        sql: ${TABLE}.latitude;;
        
    }
    
    
    dimension: longitude {
        type: number
        
        label: "Longitude"
        
        sql: ${TABLE}.longitude;;
        
    }
    
    
    dimension_group: month {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Month"
        sql: DATETRUNC('month', ${date_submitted_raw});;
        
    }
    
    
    dimension: postal {
        type: string
        
        label: "Postal"
        
        sql: ${TABLE}.postal;;
        
    }
    
    
    dimension: rating_group_ {
        type: string
        
        label: "Rating(group)"
        sql: case ${how_would_you_rate_your_experience_with_support_mozilla_org__please_help_us_by_only_rating_the_website_and_not_firefox_}	
 when 'Dissatisfied' then'Dissatisfied'	
 when 'Very Dissatisfied' then'Dissatisfied'	
 when 'Satisfied' then'Satisfied'	
 when 'Very Satisfied' then'Satisfied'	
else ${how_would_you_rate_your_experience_with_support_mozilla_org__please_help_us_by_only_rating_the_website_and_not_firefox_} end;;
        
    }
    
    
    dimension: referer {
        type: string
        
        label: "Referer"
        
        sql: ${TABLE}.referer;;
        
    }
    
    
    dimension: response_id {
        type: number
        
        label: "Response ID"
        
        sql: ${TABLE}.response_id;;
        
    }
    
    
    dimension: sessionid {
        type: string
        
        label: "Session ID"
        
        sql: ${TABLE}.sessionid;;
        
    }
    
    
    dimension: state_region {
        type: string
        
        label: "State Region"
        
        sql: ${TABLE}.state_region;;
        
    }
    
    
    dimension: status {
        type: string
        
        label: "Status"
        
        sql: ${TABLE}.status;;
        
    }
    
    
    dimension_group: time_started {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Time Started"
        
        sql: ${TABLE}.time_started;;
        
    }
    
    
    dimension: user_agent {
        type: string
        
        label: "User Agent"
        
        sql: ${TABLE}.user_agent;;
        
    }
    
    
    dimension_group: week {
        type: time
        timeframes: [raw, date, time, week, month, year]
    
        label: "Week"
        sql: DATETRUNC('week', ${date_submitted_raw});;
        
    }
    
    
    measure: angle {
        label: "Angle"
        type: number
        sql: ${csat_%} * 180 ;;
    }
    
    measure: angle_(2) {
        label: "Angle (2)"
        type: number
        sql: ${CSAT % (copy)_1834583592060903431} * 180 ;;
    }
    
    measure: csat {
        label: "CSAT"
        type: number
        sql: ${satisfied}/(${satisfied}+${neutral}+${dissatisfied}) ;;
    }
    
    measure: csat_% {
        label: "CSAT %"
        type: number
        sql: AVG(${csat})/WINDOW_MAX(AVG(1)) ;;
    }
    
    measure: csat_%_(2) {
        label: "CSAT % (2)"
        type: number
        sql: SUM(${csat})/WINDOW_MAX(AVG(1)) ;;
    }
    
    measure: csat_total {
        label: "CSAT total"
        type: number
        sql: (${satisfied}+${neutral}+${dissatisfied}) ;;
    }
    
    measure: dissatisfied {
        label: "Dissatisfied"
        type: number
        sql: IF ${rating_group_} = "Dissatisfied" THEN ${number_of_records} ELSE 0 END ;;
    }
    
    measure: neutral {
        label: "Neutral"
        type: number
        sql: IF ${rating_group_} = "Neutral" THEN ${number_of_records} ELSE 0 END ;;
    }
    
    measure: number_of_records {
        label: "Number of Records"
        type: number
        sql: 1 ;;
    }
    
    measure: number_of_records_(copy) {
        label: "Number of Records (copy)"
        type: number
        sql: 1 ;;
    }
    
    measure: satisfied {
        label: "Satisfied"
        type: number
        sql: IF ${rating_group_} = "Satisfied" THEN ${number_of_records} ELSE 0 END ;;
    }
    
    measure: total {
        label: "Total"
        type: number
        sql: ${satisfied}+ ${dissatisfied}+${neutral} ;;
    }
    
    measure: x {
        label: "X"
        type: number
        sql: IIF(ATTR(${week})=${Parameters}.${Parameter 1},
1 + SQRT(2) * COS((1+${csat_%})*180 * PI() / 180),1) ;;
    }
    
    measure: x_(m) {
        label: "X (m)"
        type: number
        sql: IIF(ATTR(${month})=${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872},
1 + SQRT(2) * COS((1-${csat_%})*180 * PI() / 180),1) ;;
    }
    
    measure: y {
        label: "Y"
        type: number
        sql: IIF(ATTR(${week})=${Parameters}.${Parameter 1},
1 + SQRT(2) * SIN(${angle} * PI() / 180),1) ;;
    }
    
    measure: y_(m) {
        label: "Y (m)"
        type: number
        sql: IIF(ATTR(${month})=${Parameters}.${Calender Week Picker (w) (copy)_2478739065951055872},
1 + SQRT(2) * SIN(${angle} * PI() / 180),1) ;;
    }
    
}