class CourseService
  def self.get_all_courses
    response = conn.get("/api/bv1/Clubs")
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(
      url: "http://golfworldapi.com"
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
