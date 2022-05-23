describe("Index", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/");
  });

  it("displays a top bar", () => {
    cy.contains("Go Fund Me");
    cy.contains("Help me go on a vacation");
  })

  it("displays the progress total", () => {
    cy.contains("Raised $441 of $1000");
  });

  it("includes form elements", () => {
    cy.get("button");
    cy.get("input[type='range']");
  })

  it("lists donations", () => {
    cy.contains("Jo donated $251");
    cy.contains("do you luv me")
    cy.contains("John donated $30");
    cy.contains("Here take a break from work")
    cy.contains("Michelle donated $20");
    cy.contains("lol")
    cy.contains("Emily donated $110");
    cy.contains("Sam donated $30");
    cy.contains("Go to miami")
  });
});
