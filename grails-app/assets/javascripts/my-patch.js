// These functions implements jQuery, and are encapsulated in avoiding conflict

(function ($) {
    // tab-pannel
    $(document).on('click',"[data-toggle='ajax']", function () {
        let url = $(this).attr('data-url')
        let $trigger = $(this)
        let $target = $($trigger.attr('href'))
        if($target.html() == ''){
            $target.load(url,function () {
                $trigger.tab('show')
            })
        }
        else{
            $trigger.tab('show')
        }
    })
}) (jQuery);
