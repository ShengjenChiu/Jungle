describe('products_details', () => {
  beforeEach(() => {
    cy.visit("/");

  });

  it("Select the product from the home page and go to the product detail page.", () => {

    cy.get('.products article')
      .first()
      .should("be.visible")
      .click();

    // cy.get('.button_to .btn-cart_add')
    //   .should("be.visible")
    //   .click();

    cy.get('.products-show')
      .should("be.visible")
    
  });  

});