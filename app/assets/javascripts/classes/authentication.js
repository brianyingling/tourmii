function Authentication(apiKey, authUrl, apiUrl) {
  this.apiKey = apiKey;
  this.authUrl = authUrl;
  this.apiUrl = apiUrl;
}

Authentication.prototype.requestAccess = function() {
  var redirect, url;

  redirect = window.location.href.replace(window.location.hash, '');
  url = this.authUrl + '/oauth2/authenticate?response_type='
                     + 'token'
                     + '&client_id='+ this.apiKey
                     + '&redirect_uri='+encodeURIComponent(redirect)
                     + '&state='+encodeURIComponent('users/self');
  window.location.href = url;
}