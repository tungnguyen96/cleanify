const { expect } = require('chai');

describe('A sample test', () => {
  it('should pass', () => {
    expect(1).to.equal(1);
  });

  it('should not pass', () => {
    expect(1).to.equal(2);
  });
});
