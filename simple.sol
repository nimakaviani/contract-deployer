pragma solidity ^0.4.10;
contract Storage {
  string storedData;
  function set(string data) {
    storedData = data;
  }
  function get() constant returns (string) {
    return storedData;
  }
}
