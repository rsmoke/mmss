function func_send_application_confirmation($array_to,$year) {

    //$term_desc = func_find_term_desc($year);
    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $array_to[email];
    $recipient = "$array_to[firstname] $array_to[lastname] <$to>";
    $subject = "UM MMSS: Confirmation of application";

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $array_to[firstname], \r\n
    This is confirmation that you have submitted an application for the Michigan Math & Science Scholars High School Summer Program for $year. \r\n
    Payment of your application fee must be completed before you will be considered for admission. \r\n

    Please refer back to the application web site (below) to review the events associated with your application. \n
    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n



    $web_apply";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
        //mail($recipient, $subject, $email, implode("\r\n", $headers));
                mail($recipient, $subject, $email, implode("\n", $headers));

        return "sent";
    }
}

function func_send_registration_confirmation($array_to,$year) {

    //$term_desc = func_find_term_desc($year);
    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $array_to[email];
    $recipient = "$array_to[firstname] $array_to[lastname] <$to>";
    $subject = "UM MMSS: Confirmation of registration";

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $array_to[firstname], \r\n
    This is a confirmation that you have registered with the Michigan Math & Science Scholars High School Summer Program WebApply system. \r\n
    Please  retain the login id ($array_to[email]) and password that you created as a friend account with the University of Michigan.
    You will need it to refer back to the application web site (below) to review the events associated with your application, to make any changes and to apply to MMSS again in the future. \r\n\n

    Should you forget your password, you will need to reset it by going to: \r\n
    https://friend.weblogin.umich.edu/friend/account/ \r\n

    and following the directions.

    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n



    $web_apply";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
       // mail($recipient, $subject, $email, implode("\r\n", $headers));
           mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}


function func_send_payment_confirmation($array_to,$year,$amount) {

    //$term_desc = func_find_term_desc($year);
    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $array_to[email];
    $recipient = "$array_to[firstname] $array_to[lastname] <$to>";
    $subject = "UM MMSS: Confirmation of payment";

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $array_to[firstname], \r\n
    This is confirmation that you have made a payment of $$amount for the Michigan Math & Science Scholars High School Summer Program for $year. \r\n
    Please refer back to the application web site (below) to review the events associated with your application.
    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n


    $web_apply";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
       // mail($recipient, $subject, $email, implode("\r\n", $headers));
         mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}

function func_send_document_confirmation($array_to,$year,$doc_type) {

    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $array_to[email];
    $recipient = "$array_to[firstname] $array_to[lastname] <$to>";
    $subject = "UM MMSS: Confirmation of Document Receipt - " . $doc_type;

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $array_to[firstname], \r\n
    This is confirmation that you have uploaded your $doc_type for the Michigan Math & Science Scholars High School Summer Program for $year. \r\n
    Please refer back to the application web site (below) to review the events associated with your application.
    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n


    $web_apply";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
        //mail($recipient, $subject, $email, implode("\r\n", $headers));
        mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}


function func_send_cc_holder_conf($accountHolderName, $email, $transactionId,$amount, $year) {

    //$term_desc = func_find_term_desc($year);
    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $email;
    $recipient = "$accountHolderName <$to>";
    $subject = "UM MMSS: Confirmation of payment";

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $accountHolderName, \r\n
    This is confirmation that a credit card in your name has been used to make a payment of $$amount for the Michigan Math & Science Scholars High School Summer Program for $year. \r\n
    The confirmation number is $transactionId. If you believe this is in error, please contact our office.
    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n
    ";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    //$headers[] = "Bcc: John <johntorgersen@yahoo.com>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
        //mail($recipient, $subject, $email, implode("\r\n", $headers));
        mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}

function func_send_recommendation_link($id_applicant,$year,$rcmdr_email,$rcmdr_fname,$rcmdr_lname,$secret_key) {

    $arr_applicant = func_pull_applicant_info($id_applicant);
    $app_fname = $arr_applicant['firstname'];
    $app_lname = $arr_applicant['lastname'];

    //$term_desc = func_find_term_desc($year);
    $off_address = "University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu >";

    $to = $rcmdr_email;
    $recipient = "$rcmdr_fname $rcmdr_lname <$to>";
    $subject = "Recommendation for $app_fname $app_lname" ;

    $temp = trim($id_applicant) . trim($year) . trim($rcmdr_email) . $secret_key;

    // $hashval = md5($temp);
    $hashval = hash('sha256', $temp);

    $web_apply = "http://www.math.lsa.umich.edu/mmss/mmss_recommender.php?id=$id_applicant&yr=$year&email=$rcmdr_email&hash=$hashval";

    $email = "    Hello $rcmdr_fname $rcmdr_lname, \r\n
    You are receiving this email because a student applying to the University of Michigan's Michigan Math & Science Scholars High School Summer Program has listed you as a recommender. \r\n
    Please follow the link below by either clicking on it, or pasting it into the address line of your favorite web browser.
    You will be taken to a web-page where you can type or paste in your recommendation for $app_fname $app_lname. \r\n

    $web_apply \r\n

    Thank you very much for assisting with $app_fname's academic development. \r\n\n

    MMSS Office Staff\r\n
    mmss@umich.edu
    ";

    $headers = array();
    //$headers[] = "MIME-Version: 1.0";
    //$headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
       // mail($recipient, $subject, $email, implode("\r\n", $headers));
         mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}

function func_send_rcmdr_email_conf_to_applicant($id_applicant,$year,$rcmdr_email,$rcmdr_fname,$rcmdr_lname) {

    $arr_applicant = func_pull_applicant_info($id_applicant);
    $app_fname = $arr_applicant['firstname'];
    $app_lname = $arr_applicant['lastname'];

    //$term_desc = func_find_term_desc($year);
    $off_address = "University of Michigan MMSS High School Summer Program <mmss-recommend@umich.edu >";

    $to = $arr_applicant['email']; //$rcmdr_email;
    $recipient = "$app_fname $app_lname <$to>";
    $subject = "Recommendation for $app_fname $app_lname sent to $rcmdr_fname $rcmdr_lname" ;

    $email = "    Hello $app_fname $app_lname, \r\n
    The University of Michigan's Michigan Math & Science Scholars High School Summer Program has sent an email to $rcmdr_fname $rcmdr_lname ($rcmdr_email)
        with directions for submitting a recommendation on your behalf. When the recommendation is submitted, it will be noted in the events section of the Web Apply application.\r\n

    The MMSS office can help with any difficulties in submitting the recommendation. \r\n

    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n";

    $headers = array();
    //$headers[] = "MIME-Version: 1.0";
    //$headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
        //mail($recipient, $subject, $email, implode("\r\n", $headers));
        mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}

function func_send_application_acceptance($array_to,$year) {

    //$term_desc = func_find_term_desc($year);
    $off_address = "Michigan Math & Science Scholars High School Summer Program <mmss@umich.edu >";

    $to = $array_to[email];
    $recipient = "$array_to[firstname] $array_to[lastname] <$to>";
    $subject = "UM MMSS: Confirmation of offer response";

    $web_apply = "https://www.math.lsa.umich.edu/mmss/mmss_app.php";

    $email = "    Hello $array_to[firstname], \r\n
    This is confirmation that your admission offer response has been received. \r\n

    Please refer back to the application web site (below) to review the events associated with your application. \n
    \r\n
    MMSS Office Staff\r\n
    mmss@umich.edu\r\n\n



    $web_apply";

    $headers = array();
    $headers[] = "MIME-Version: 1.0";
    $headers[] = "Content-type: text/plain; charset=iso-8859-1";
    $headers[] = "From: $off_address";
    $headers[] = "Bcc: MMSS Office <mmss@umich.edu>";
    $headers[] = "Reply-To: $off_address";
//    $headers[] = "Subject: {$subject}";
    $headers[] = "X-Mailer: PHP/" . phpversion();

    if (!func_validate_email($to)) {
        return "not sent";
        exit;
    } else{
        //mail($recipient, $subject, $email, implode("\r\n", $headers));
         mail($recipient, $subject, $email, implode("\n", $headers));
        return "sent";
    }
}
