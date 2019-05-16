import React from 'react';

export default class SchoolsPage extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      schools: [],
      isLoading: true,
    }
  }

  componentDidMount() {
    fetch('http://localhost:3000/api/v1/schools').then((res) => {
      return res.json();
    }).then((res) => {
      console.log(res)
      this.setState({
        schools: res.schools,
        isLoading:false
      })
    })
  }

  render() {
    return(
      <main className="school-page">
        {this.state.schools.map((school) => {
          return(
            <div style={styles.school.container}>
              <div style={styles.school.header}>
                {school.name}
              </div>
              <div style={styles.school.location}>
                {school.location}
              </div>
              <div>
                Contact Us at: {school.email}
              </div>
            </div>
          )
        })}
      </main>
    )
  }
}

const styles = {
  school: {
    container: {
      width: '600px',
      height: '200px',
    },
    header: {
      color: 'purple',
    },
    location: {
      color: 'red'
    }
  }
}