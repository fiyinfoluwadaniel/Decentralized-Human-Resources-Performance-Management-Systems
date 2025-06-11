# Decentralized Human Resources Performance Management System

A blockchain-based HR performance management system built on the Stacks blockchain using Clarity smart contracts. This system provides transparent, decentralized, and immutable HR processes for organizations.

## Overview

This system consists of five interconnected smart contracts that manage different aspects of HR performance management:

1. **HR Verification Contract** - Validates and manages HR departments
2. **Goal Setting Contract** - Manages employee performance goals
3. **Review Coordination Contract** - Coordinates performance reviews
4. **Feedback Collection Contract** - Collects and manages performance feedback
5. **Development Planning Contract** - Plans and tracks employee development programs

## Features

### 🏢 HR Department Management
- Register and verify HR departments
- Manage HR administrators
- Ensure only verified HR departments can perform administrative functions

### 🎯 Goal Setting
- Create and assign performance goals to employees
- Track goal progress and status
- Update goal completion status
- Maintain goal history and metrics

### 📋 Performance Reviews
- Schedule performance review cycles
- Coordinate between reviewers and employees
- Track review completion and ratings
- Manage review participants and roles

### 💬 Feedback Collection
- Collect structured feedback from multiple sources
- Support anonymous feedback options
- Calculate average ratings and feedback summaries
- Categorize feedback by type (teamwork, leadership, etc.)

### 📈 Development Planning
- Create personalized development plans
- Set development milestones and timelines
- Track skill development progress
- Monitor completion of development activities

## Smart Contract Architecture

### Contract Dependencies
\`\`\`
hr-verification (base contract)
↓
goal-setting → review-coordination → feedback-collection
↓
development-planning
\`\`\`

### Key Data Structures

#### HR Departments
- Department ID, name, admin principal
- Verification status and creation timestamp
- Admin-to-department mapping

#### Goals
- Goal ID, employee, HR admin, title, description
- Target dates, status, and timestamps
- Employee goal counters

#### Reviews
- Review ID, employee, reviewer, review periods
- Status, ratings, and completion timestamps
- Participant roles and permissions

#### Feedback
- Feedback ID, review association, ratings
- Text feedback, categories, anonymity flags
- Aggregated feedback summaries

#### Development Plans
- Plan ID, employee, HR admin, descriptions
- Skills to develop, timelines, progress tracking
- Milestones with completion status

## Getting Started

### Prerequisites
- Stacks blockchain node or testnet access
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd decentralized-hr-system
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

1. Deploy contracts in the following order:
    - hr-verification.clar
    - goal-setting.clar
    - review-coordination.clar
    - feedback-collection.clar
    - development-planning.clar

2. Initialize the HR verification contract with the contract owner

3. Register and verify HR departments

## Usage Examples

### Register HR Department
\`\`\`clarity
(contract-call? .hr-verification register-department "Engineering HR" 'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG)
\`\`\`

### Create Employee Goal
\`\`\`clarity
(contract-call? .goal-setting create-goal
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"Complete Project Alpha"
"Finish the alpha version of the new product"
u1000)
\`\`\`

### Schedule Performance Review
\`\`\`clarity
(contract-call? .review-coordination schedule-review
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
'ST3AM1A56AK2C1XAFJ4115ZSV26EB49BVQ10MGCS0
u100
u200)
\`\`\`

### Submit Feedback
\`\`\`clarity
(contract-call? .feedback-collection submit-feedback
u1
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"Excellent teamwork and communication"
u5
"teamwork"
false)
\`\`\`

### Create Development Plan
\`\`\`clarity
(contract-call? .development-planning create-development-plan
'ST2CY5V39NHDPWSXMW9QDT3HC3GD6Q6XX4CFRK9AG
"Leadership Development"
"Develop leadership and management skills"
"Team management, Strategic thinking"
u180)
\`\`\`

## Testing

The system includes comprehensive tests for all contracts using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test hr-verification
npm test goal-setting
npm test review-coordination
npm test feedback-collection
npm test development-planning
\`\`\`

## Security Considerations

- **Access Control**: Only verified HR administrators can perform administrative functions
- **Data Integrity**: All data is stored immutably on the blockchain
- **Privacy**: Support for anonymous feedback while maintaining accountability
- **Validation**: Input validation and error handling throughout all contracts

## Error Codes

| Code | Description |
|------|-------------|
| u100-u103 | HR Verification errors (owner-only, not-found, already-exists, unauthorized) |
| u200-u202 | Goal Setting errors (unauthorized, not-found, invalid-status) |
| u300-u302 | Review Coordination errors (unauthorized, not-found, invalid-period) |
| u400-u402 | Feedback Collection errors (unauthorized, not-found, invalid-rating) |
| u500-u502 | Development Planning errors (unauthorized, not-found, invalid-status) |

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions and support, please open an issue in the GitHub repository.
\`\`\`

Finally, let's create the PR details file:
