const http = require("http");
const chai = require("chai");
const chaiHttp = require("chai-http");
const expect = chai.expect;

chai.use(chaiHttp);

// Website address
const app = "http://gitlab_httpserv:8080";

describe("HTTPSERV", () => {

  let res;

  before(async () => {
  res = await chai
    .request(app)
    .get("/");
  });

  describe("Server", () => {
    it("should be up and return status 200", () => {
      expect(res.status).to.equal(200);
    });
  });

  describe("HTTP", () => {
    it("content-type should be text/plain", () => {
      expect(res).to.have.header("content-type", "text/plain");
    });

    describe("body text should include Topic 'my.o'", () => {
      it("for MSG_1", () => {
        expect(res.text).to.include("Topic my.o MSG_1");
      });
      it("for MSG_2", () => {
        expect(res.text).to.include("Topic my.o MSG_2");
      });
      it("for MSG_3", () => {
        expect(res.text).to.include("Topic my.o MSG_3");
      });
    });

    describe("body text should include Topic 'my.i'", () => {
      it("for MSG_1", () => {
        expect(res.text).to.include("Topic my.i Got MSG_1");
      });
      it("for MSG_2", () => {
        expect(res.text).to.include("Topic my.i Got MSG_2");
      });
      it("for MSG_3", () => {
        expect(res.text).to.include("Topic my.i Got MSG_3");
      });
    });
  });
});
