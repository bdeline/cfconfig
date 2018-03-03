/**
*********************************************************************************
* Copyright Since 2017 CommandBox by Ortus Solutions, Corp
* www.ortussolutions.com
********************************************************************************
* @author Brett DeLine
*/
component extends="tests.BaseTest" appMapping="/tests" {
		
	function run(){

		describe( "Adobe9PasswordManager Test", function(){
			
			it( "is seed correct", function() {
				var Adobe9PasswordManager = getInstance( 'Adobe9PasswordManager@adobe-password-util' );
				
				expect( Adobe9PasswordManager.getSeed() ).toBe('0yJ!@1$r8p0L@r1$6yJ!@1rj');				
			});

			it( "generate3DesKey is correct", function() {
				var Adobe9PasswordManager = getInstance( 'Adobe9PasswordManager@adobe-password-util' );

				var keyResults = Adobe9PasswordManager._generate3DesKey(Adobe9PasswordManager.getSeed());
				
				expect( keyResults ).toBe('MHlKIUAxJHI4cDBMQHIxJDZ5SiFAMXJq');				
			});

			it( "encryptDataSource is correct", function() {
				var Adobe9PasswordManager = getInstance( 'Adobe9PasswordManager@adobe-password-util' );

				var encrpytResults = Adobe9PasswordManager.encryptDataSource('test1234');
				
				expect( encrpytResults ).toBe('zy6RB5Ph+zDWGA8xe7rd4w==');				
			});

			it( "decryptDatasource is correct", function() {
				var Adobe9PasswordManager = getInstance( 'Adobe9PasswordManager@adobe-password-util' );

				var decryptResults = Adobe9PasswordManager.decryptDataSource('zy6RB5Ph+zDWGA8xe7rd4w==');
				
				expect( decryptResults ).toBe('test1234');				
			});

			/*
			//Abandonging this
			it( "decryptDatasource 'seed.properties' encoding is correct", function() {
				var Adobe9PasswordManager = getInstance( 'Adobe9PasswordManager@adobe-password-util' );

				var secretKey = 'QzA5MjBDOUQwNjVDNEZCMQ==';  
				var seed = '0yJ!@1$r8p0L@r1$6yJ!@1rj';  
				var pass = '8dmRT7lsAUNSb+kFuKNOow==';
				var algorithm = 'DESede';

				Adobe9PasswordManager.setSeed(seed);
				Adobe9PasswordManager.setAlgorithm(algorithm);
				var decryptResults = Adobe9PasswordManager.decryptDataSource(pass);
				
				expect( decryptResults ).toBe('test1234');				
			});
			*/
		});

	}

}
