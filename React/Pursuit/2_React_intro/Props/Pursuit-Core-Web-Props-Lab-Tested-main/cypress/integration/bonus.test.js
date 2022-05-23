describe("Bonus", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("displays percentage progress", () => {
    cy.get(".progress").contains("44.10%");
  });
});
