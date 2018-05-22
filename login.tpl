<!DOCTYPE html>
<html lang="en">
{if isset($error) && $error != ''}
	<div class="alert alert-danger">{$error}</div>
{/if}
{if isset($notice) && $notice != ''}
	<div class="alert alert-info">{$notice}</div>
{/if}
{if isset($sent) && $sent != ''}
	<div class="alert alert-info">A link to reset your password has been sent to your e-mail account.</div>
{/if}
<head>
	<!--
		===
		This comment should NOT be removed.
		Charisma v2.0.0
		Copyright 2012-2014 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0
		http://usman.it
		http://twitter.com/halalit_usman
		===
	-->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="ch-container">
	<div class="row">
		<div class="row">
			<div class="col-md-12 center login-header">
				<h2>Please login</h2>
			</div>
			<!--/span-->
		</div>
		<!--/row-->
		<div class="row">
			<div class="well col-md-5 center login-box">
				<div class="alert alert-info">
					Please login with your Username and Password.
				</div>
				<form class="form-horizontal" method="post" action="login">
					{{csrf_field()}}
					{if isset($redirect)}
						<input type="hidden" name="redirect" value="{$redirect|escape:"htmlall"}"/>
					{/if}
					<fieldset>
						<div class="input-group input-group-lg">
							<span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
							<input id="username" name="username" type="text" class="form-control"
								   placeholder="Username or email">
						</div>
						<div class="clearfix"></div>
						<br>
						<div class="input-group input-group-lg">
							<span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
							<input id="password" name="password" type="password" class="form-control"
								   placeholder="Password">
						</div>
						<div class="clearfix"></div>
						<div class="input-prepend">
							<label class="rememberme" for="rememberme"><input id="rememberme"
																			  {if isset($rememberme) && $rememberme == 1}checked="checked"{/if}
																			  name="rememberme" type="checkbox">
								Remember me</label>
						</div>
						<div class="clearfix"></div>
						<p class="center col-md-5">
						<p class="center col-md-5">
							{if {env('NOCAPTCHA_ENABLED')} == 1 && !empty({env('NOCAPTCHA_SITEKEY')}) && !empty({env('NOCAPTCHA_SECRET')})}
								{NoCaptcha::display()}{NoCaptcha::renderJs()}
							{/if}
						</p>
						<button type="submit" class="btn btn-primary">Login</button>
					</fieldset>
				</form>
				<a href="{$serverroot}forgottenpassword" class="text-center">I forgot my password</a><br>
				<a href="{$serverroot}register" class="text-center">Register a new membership</a>
			</div>
			<!--/span-->
		</div>
		<!--/row-->
	</div>
	<!--/fluid-row-->
</div>
<!--/.fluid-container-->
</body>
</html>
