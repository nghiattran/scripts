#!/usr/bin/env node

const inquirer = require('inquirer');
const program = require('commander');
const path = require('path');
const { exec } = require('child_process');
const fs = require('fs');

class SearchMachine {
    constructor(entries) {
        this.entries = entries;
    }

    search(answers, input) {
      return new Promise(resolve => resolve(this.entries.filter(this.filter(input))));
    }

    filter(input) {
        input = input || '';
        return list => {
            if (!list) return input;
            return new RegExp(input, 'i').exec(list) !== null;
        };
    }
}

function parseLines(input) {
    return input.split('\n').filter(e => e !== '');
}

program
    .version('0.0.1')

program
    .command('ask <question> <choices>')
    .option('-e, --exec <cmd>', 'Exec subsequence command with picked answer.')
    .description('Prompt question to answer with autocomplete')
    .action((question, choices, options) => {
        const choiceEntries = parseLines(choices);
        inquirer
            .registerPrompt('autocomplete', require('inquirer-autocomplete-prompt'));

        const searchMachine = new SearchMachine(choiceEntries);
        inquirer
            .prompt([{
                type: 'autocomplete',
                name: 'answer',
                message: question,
                source: (answersSoFar, input) => {
                    return searchMachine.search(answersSoFar, input);
                },
            }])
            .then(answers => {
                fs.writeFileSync(process.env.DOLET_ANSWER_FILE, answers.answer.trim());
            });
    });

program.parse(process.argv);

if (program.args.length === 0) program.help()