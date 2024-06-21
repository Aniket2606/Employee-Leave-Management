 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
    // Initialize popover manually
    var popover = new bootstrap.Popover(document.getElementById('popover-btn'), {
        html: true,
        content: function () {
            return document.getElementById('popover-content').innerHTML;
        }
    });
</script>

<!--Full Screen function-->
<script>
$(document).ready(function() {
    // Toggle dropdown menu when cog button is clicked
//    $('#optionsDropdown').on('click', function(e) {
//        $('.dropdown-menu').toggle();
//    });
    $('#fsb').click(toggleFullScreen);
});


// Function to toggle full screen
        function toggleFullScreen() {
            var elem = document.documentElement;
            if (!document.fullscreenElement) {
                elem.requestFullscreen().catch(err => {
                    console.log(`Error attempting to enable full-screen mode: ${err.message}`);
                });
            } else {
                if (document.exitFullscreen) {
                    document.exitFullscreen();
                }
            }
        }

</script>