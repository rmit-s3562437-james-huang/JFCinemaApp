import XCTest
@testable import JFCinemaApp

class TicketTests: XCTestCase {
    
    var testTicket:Ticket!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        testTicket = nil
    }
    
    func testOneChildTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 1, concess: 0, adult: 0)
        XCTAssertTrue(testTicket.totalPrice == 9.50)
    }
    
    func testOneConcessTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 0, concess: 1, adult: 0)
        XCTAssertTrue(testTicket.totalPrice == 12.00)
    }
    
    func testOneAdultTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 0, concess: 0, adult: 1)
        XCTAssertTrue(testTicket.totalPrice == 14.00)
    }
    
    func testChildConcessTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 1, concess: 1, adult: 0)
        XCTAssertTrue(testTicket.totalPrice == 21.50)
    }
    
    func testAdultChildTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 1, concess: 0, adult: 1)
        XCTAssertTrue(testTicket.totalPrice == 23.50)
    }
    
    func testConcessAdultTicketTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 0, concess: 1, adult: 1)
        XCTAssertTrue(testTicket.totalPrice == 26.00)
    }
    
    func testAllTicketsTotalPrice() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 1, concess: 1, adult: 1)
        XCTAssertTrue(testTicket.totalPrice == 35.50)
    }
    
    func testNegativeTickets() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: -1, concess: 0, adult: 0)
        XCTAssertTrue(testTicket.totalPrice == -9.5)
    }
    
    func testNoTickets() {
        testTicket = Ticket(title: "minions", sess: "10:30", child: 0, concess: 0, adult: 0)
        XCTAssertTrue(testTicket.totalPrice == 0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
