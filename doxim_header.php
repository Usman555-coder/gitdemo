<div class="header pt-2 pb-2" style="padding: 0 30px;">
    <!-- <ul class="toolbar-group d-flex align-items-center justify-content-between">
        <div></div>
        <div class="d-flex">
            <li class="toolbar-item" style="padding-right: 20px;">
                <a href="javascript:void(0)" onclick="abc()" class="logoutLink d-flex align-items-center">
                    <img src="assets/images/Logout.svg" alt="Log Out" class="header-icons pr-2 common-header-icon" style="width: 22px;"><span style="font-size: 16px;">Log Out</span>
                </a>
            </li>
        </div>
    </ul> -->
</div>
<script>
    function abc() {
        fetch('http://localhost/interspire/iem/admin/index.php?Page=Logout').then(function(response) {
            // The API call was successful!
            window.location.href("http://localhost/interspire/");
            //return response.json();
        }).then(function(data) {
            // This is the JSON from our response
            //console.log(data);
            window.location.href("http://localhost/interspire/");
        }).catch(function(err) {
            // There was an error
            //console.warn('Something went wrong.', err);
            window.location.assign("http://localhost/interspire/");
        });

        // fetch('/about').then(function(response) {
        //     // The API call was successful!
        //     return response.text();
        // }).then(function(html) {
        //     // This is the HTML from our response as a text string
        //     console.log(html);
        // }).catch(function(err) {
        //     // There was an error
        //     console.warn('Something went wrong.', err);
        // });
    }
</script>