const titleToSlug = title => (title || '').toLowerCase().split(' ').join('-');

module.exports = {
  titleToSlug,
};
