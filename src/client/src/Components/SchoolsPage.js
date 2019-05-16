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
      setTimeout(() => {
        this.setState({
          schools: res.schools,
          isLoading: false
        })
      }, 2000)
    })
  }

  render() {
    if(this.state.isLoading) {
      return(
        <div>
          This is the first render... 
          Once the component mounts our componenetDidMount() method will fire
          Inside that method we are calling this.setState() with new data
          which will trigger a re-render of the component
        </div>
      )
    }
    return(
      <main className="school-page">

        {this.state.schools.map((school, index) => {
          return(
            <div key={index} style={styles.school.container}>
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