describe('products_details', () => {
  beforeEach(() => {
    cy.visit("/");

  });

  it("users can click the 'Add to Cart' button for a product on the home page and then their cart increase by one.", () => {

    cy.get('.products article')
      .first()
      .should("be.visible")
      .click();

    cy.wait(2000);

    cy.get('.btn-cart_add')
      .should("be.visible")
      .click();

    cy.get('.products-show')
      .should("be.visible")
    
    cy.wait(2000);

    cy.get('.navbar')
      .contains('My Cart (1)');

  });  

});