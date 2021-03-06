(function(){
    'user strict'

    let input = document.querySelectorAll('.input100');
    let submitForm = document.querySelector('.login100-form-btn');

    submitForm.addEventListener('click', (e)=>{
        let submitFlag = false;
        e.preventDefault();

        input.forEach((e)=>{
            const targetNode = e.parentNode;
            if(targetNode.classList){
                targetNode.classList.remove('alert-validate');
            }else{
                targetNode.className = targetNode.className.replace(new RegExp('(^|\\b)' + 'alert-validate'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
            }
        });

        [].every.call(input, (element)=>{
            if(!validate(element)){
                showValidate(element);
                submitFlag = false;
                return false;
            }else{
                submitFlag = true;
                return true;
            }
        });

        if(submitFlag) document.getElementsByClassName('login100-form')[0].submit();
    });

    input.forEach((e)=>{
        e.addEventListener('focus', (e)=>{
            const targetNode = e.target.parentNode;
            if(targetNode.classList){
                targetNode.classList.remove('alert-validate');
            }else{
                targetNode.className = targetNode.className.replace(new RegExp('(^|\\b)' + 'alert-validate'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
            }
        });
    });

    /* document.querySelector('.validate-form').addEventListener('submit', ()=>{
        let check = true;

        [].forEach.call(input, (element)=>{
            if(!validate(element)){
                showValidate(element);
                check=false;
            }
        });

        return check;
    });

    [].forEach.call(input, (element)=>{
        element.addEventListener('focus', ()=>{
            hideValidate(element);
        });
    }); */

    function validate(input){
        /* if(input.getAttribute('type')==='email' || input.getAttribute('name')==='email'){
            if(input.value.trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }else{
                return true;
            }
        } */
            if(input.value.trim() == ''){
                return false;
            }else{
                return true;
            
        }
    }

    function showValidate(input) {
        let thisAlert = input.parentNode;
        if(thisAlert.classList){
            thisAlert.classList.add('alert-validate');
        }else{
            thisAlert.className += ' ' + 'alert-validate';
        }
    }

    function hideValidate(input) {
        let thisAlert = input.parentNode;

        if (thisAlert.classList){
            thisAlert.classList.remove('alert-validate');
        }else{
            thisAlert.className = thisAlert.className.replace(new RegExp('(^|\\b)' + 'alert-validate'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
        }
    }

    /*==================================================================
    [ Show pass ]*/
    let showPass = 0;

    let btnShowPass = document.querySelector('.btn-show-pass');
    btnShowPass.addEventListener('click', ()=>{
        let nextIpt = btnShowPass.nextElementSibling;
        let findI = btnShowPass.querySelector('i');
        if(showPass===0){            
            nextIpt.setAttribute('type', 'text');
            if(findI.classList){ //IE 10이상
                findI.classList.remove('fa-eye');
                findI.classList.add('fa-eye-slash');
            }else{
                findI.className = findI.className.replace(new RegExp('(^|\\b)' + 'fa-eye'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                findI.className += ' ' + 'fa-eye-slash';
            }
            showPass = 1;
        }else{
            nextIpt.setAttribute('type', 'password');
            if(findI.classList){
                findI.classList.remove('fa-eye-slash');
                findI.classList.add('fa-eye');
            }else{
                findI.className = findI.className.replace(new RegExp('(^|\\b)' + 'fa-eye-slash'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                findI.className += ' ' + 'fa-eye';
            }
            showPass = 0;
        }
    });
    
    const socials = document.querySelectorAll('#facebookBtn, #twitterBtn, #wechatBtn');
    
    [].forEach.call(socials, (element)=>{
        element.addEventListener('click', ()=>{
            alert('서비스 준비중 입니다.');
        });
    });

    document.querySelector("#main").addEventListener('click',()=>{
        location.href = "http://localhost:8080/spring_xml/index";
    });
    
})();