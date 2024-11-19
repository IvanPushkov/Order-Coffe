

import XCTest
@testable import Order_Coffe

final class RegistrationTest: XCTestCase {
    var authManager: AuthManager!
    var registerData:[AccountData : String?]?
    override func setUpWithError() throws {
         authManager = AuthManager()
         registerData = [.login : "first@Yandex.ru",
                            .password: "12345Qq",
                            .repeatedPassword: "12345Qq"]
    }

    override func tearDownWithError() throws {
        authManager = nil
        registerData = nil
    }

    func testInvaildName() throws {
        registerData?[.login]  =  "first@Yan"
        authManager.getCondition(accountData: registerData!, authOperation: .register) { answer in
            XCTAssertEqual(answer, .serverError)
        }
    }
    func testInvaildPassword() throws {
        registerData?[.password]  =  "11"
        authManager.getCondition(accountData: registerData!, authOperation: .register) { answer in
            XCTAssertEqual(answer, .passwordTooShort)
        }
    }
    func testIncorrectRepeatedPassword() throws {
        registerData?[.repeatedPassword]  =  "11"
        authManager.getCondition(accountData: registerData!, authOperation: .register) { answer in
            XCTAssertEqual(answer, .passwordRepeat)
        }
    }
    func testRegisterWithoutSecondPassword() throws{
        registerData?[.repeatedPassword]  = nil
        authManager.getCondition(accountData: registerData!, authOperation: .register) { answer in
            XCTAssertEqual(answer, .passwordRepeat)
        }
    }
    
    func testPerformanceExample() throws {
       
        self.measure {
            authManager.getCondition(accountData: registerData!, authOperation: .register) { answer in
                XCTAssertEqual(answer, .passwordRepeat)
            }
        }
    }

}
