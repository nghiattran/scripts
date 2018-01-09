#!/usr/bin/env node

const copy = require('copy-to-clipboard');
console.log(copy)
copy(process.argv[process.argv.length - 1])